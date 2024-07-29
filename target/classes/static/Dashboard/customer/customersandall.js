/**
 * 
 */
  // Function to populate form fields when editing user



var searchHistory = [];

document.addEventListener('DOMContentLoaded', function() {
    loadSearchHistory();
});

function filterTable() {
    var startTime = performance.now();
    var searchValue = document.getElementById('searchInput').value.toLowerCase();
    var table = document.getElementById('dataTable');
    var rows = table.getElementsByTagName('tr');

    for (var i = 1; i < rows.length; i++) {
        var cells = rows[i].getElementsByTagName('td');
        var nameCell = cells[2];
        if (nameCell) {
            var nameValue = nameCell.textContent || nameCell.innerText;
            if (nameValue.toLowerCase().indexOf(searchValue) > -1) {
                rows[i].style.display = '';
            } else {
                rows[i].style.display = 'none';
            }
        }
    }

    var endTime = performance.now();
    var timeTaken = endTime - startTime;
    var timeTakenDisplay = document.getElementById('timeTakenDisplay');
    timeTakenDisplay.innerText = 'Search Time: ' + timeTaken.toFixed(2) + ' milliseconds';
}

function addSearchHistory() {
    var searchValue = document.getElementById('searchInput').value.toLowerCase();
    var table = document.getElementById('dataTable');
    var rows = table.getElementsByTagName('tr');

    for (var i = 1; i < rows.length; i++) {
        var cells = rows[i].getElementsByTagName('td');
        var nameCell = cells[2];
        var profileCell = cells[1];

        if (nameCell) {
            var nameValue = nameCell.textContent || nameCell.innerText;
            
            if (nameValue.toLowerCase() === searchValue) {
                var imageSrc = profileCell.getElementsByTagName('img')[0].src;
                if (searchValue) {
                    // Remove existing entry if it exists
                    searchHistory = searchHistory.filter(item => item.value !== searchValue);

                    // Add new entry to the top
                    searchHistory.unshift({
                        value: nameValue,
                        image: imageSrc
                    });

                    // Limit to 5 entries
                    if (searchHistory.length > 5) {
                        searchHistory.pop();
                    }

                    saveSearchHistory();
                }
            }
        }
    }
}

function highlightMatch(text, searchValue) {
    var startIndex = text.toLowerCase().indexOf(searchValue);
    if (startIndex !== -1) {
        var endIndex = startIndex + searchValue.length;
        return text.substring(0, startIndex) + '<span class="highlight">' + text.substring(startIndex, endIndex) + '</span>' + text.substring(endIndex);
    }
    return text;
}

function showSearchHistory() {
    var searchValue = document.getElementById('searchInput').value.toLowerCase();
    var searchHistoryList = document.getElementById('searchHistoryList');
    searchHistoryList.innerHTML = '';

    if (searchValue === "") {
        $('#searchInput').dropdown('hide');
        return;
    }

    var filteredHistory = searchHistory.filter(function(item) {
        return item.value.toLowerCase().includes(searchValue);
    });

    if (filteredHistory.length > 0) {
        filteredHistory.forEach(function(item) {
            var listItem = document.createElement('a');
            listItem.className = 'dropdown-item search-history-item';
            listItem.setAttribute('href', '#');
            
            var img = document.createElement('img');
            img.src = item.image;
            img.style.height = '20px';
            img.style.width = '20px';
            img.style.marginRight = '5px';
            
            var textSpan = document.createElement('span');
            textSpan.innerHTML = highlightMatch(item.value, searchValue);

            listItem.appendChild(img);
            listItem.appendChild(textSpan);

            listItem.onclick = function() {
                document.getElementById('searchInput').value = item.value;
                filterTable();
            };

            searchHistoryList.appendChild(listItem);
        });
        $('#searchInput').dropdown('show');
    } else {
        $('#searchInput').dropdown('hide');
    }
}

function saveSearchHistory() {
    localStorage.setItem('searchHistory', JSON.stringify(searchHistory));
}

function loadSearchHistory() {
    var storedHistory = localStorage.getItem('searchHistory');
    if (storedHistory) {
        searchHistory = JSON.parse(storedHistory);
    }
}

function handleFileUpload(event) {
    var file = event.target.files[0];
    if (file) {
        var formData = new FormData();
        formData.append("file", file);
    var duplicateCount;
        var loader = document.getElementById('loader');
        loader.style.display = 'inline-block';

        fetch('/upload', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            loader.style.display = 'none';
            if (response.ok) {
                return response.json();
            } 
        })
        .then(data => {
            if (data.error) {
                showUploadMessage(data.error, 'error');
            } else {
                var successMessage = 'File uploaded successfully.';
                if (data.duplicateCount > 0) {
                    successMessage += ' ' + data.duplicateCount + ' duplicates were found.';
                }
                showUploadMessage(successMessage, 'success');
                if (data.duplicateCount === 0) {
                    filterTable(); // Refresh table only if no duplicates were found
                }
            }
        })
        .catch(error => {
            loader.style.display = 'none';
            console.error('Error:', error);
            showUploadMessage('Error duplicates not allowed.', 'error');
        });
    }
}

function showUploadMessage(message, type) {
    var messageContainer = document.getElementById('messageContainer');
    var alertClass = type === 'success' ? 'alert-success' : 'alert-danger';
    var alertMessage = '<div class="alert ' + alertClass + ' alert-dismissible fade show" role="alert">' +
                        '<strong>' + message + '</strong>' +
                        '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
                        '<span aria-hidden="true">&times;</span>' +
                        '</button>' +
                        '</div>';
    messageContainer.innerHTML = alertMessage;

    setTimeout(() => {
        messageContainer.innerHTML = '';
    }, 5000);
}