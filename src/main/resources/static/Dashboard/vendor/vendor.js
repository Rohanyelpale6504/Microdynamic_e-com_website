/**
 * 
 */
 var searchHistory = [];

  // Load search history on page load
  $(document).ready(function() {
    loadSearchHistory();
  });

  function filterTable() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("companyTableBody");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[1]; // Change index based on the column you want to filter
      if (td) {
        txtValue = td.textContent || td.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
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
        listItem.innerHTML = highlightMatch(item.value, searchValue);

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

  function addSearchHistory() {
    var searchValue = document.getElementById('searchInput').value.toLowerCase();
    var table = document.getElementById('companyTableBody');
    var rows = table.getElementsByTagName('tr');

    for (var i = 0; i < rows.length; i++) {
      var cells = rows[i].getElementsByTagName('td');
      var nameCell = cells[1];

      if (nameCell) {
        var nameValue = nameCell.textContent || nameCell.innerText;
        
        if (nameValue.toLowerCase() === searchValue) {
          if (searchValue) {
            // Remove existing entry if it exists
            searchHistory = searchHistory.filter(item => item.value !== searchValue);

            // Add new entry to the top
            searchHistory.unshift({
              value: nameValue
            });

            // Limit to 5 entries
            if (searchHistory.length > 5) {
              searchHistory.pop();
            }

            saveSearchHistory();
            showSearchHistory();
          }
        }
      }
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