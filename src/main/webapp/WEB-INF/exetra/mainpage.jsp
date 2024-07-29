<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" xmls:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Table with JSTL</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .search-history-item {
            background-color: white;
        }
        .dropdown-menu {
            max-height: 200px;
            overflow-y: auto;
        }
        .search-history-icon {
            margin-right: 5px;
        }
        .highlight {
            font-weight: bold;
            background-color: yellow;
        }
        .inputBox{
        width: 60% !importent;
        }
        #searchInput{
        width:210%;
        margin-left: 70%;
        }
        .headermain{
        width:100%;
        }
        .dropdown-menu {
    position: absolute;
    top: 100%;
    left: 145px;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 27rem;
    padding: -0.5rem 0;
    margin: .125rem 0 0;
    font-size: 1rem;
    color: #212529;
    text-align: left;
    list-style: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0, 0, 0, .15);
    border-radius: .25rem;
}
        .table-wrapper {
            max-height: 400px; /* Set desired height */
            overflow-y: auto;
        }
        .thead-dark{
        position: static;
       
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row headermain">
        <div class="col-md-3">
        <img alt=""
					src="${pageContext.request.contextPath}/logo/logo.png"
					style="width: 191px; height: 43px; margin-left: -25px;"> </div>
        <div class="col-md-9">
            <div class="form-inline  inputBox">
                <div class="dropdown"  >
                    <input id="searchInput"  class="form-control  dropdown-toggle" type="search" placeholder="Search" aria-label="Search" data-toggle="dropdown" onkeyup="filterTable(); showSearchHistory()">
                    <div id="searchHistoryList" class="dropdown-menu"></div>
                </div>
                <button class="btn btn-outline-success my-2 my-sm-0"  style="margin-left: 48%;" type="button" onclick="addSearchHistory()">Search</button>
            </div>
        </div>
    </div>

    <!-- Timing display -->
    <div class="row mt-3">
        <div class="col-md-12 text-center">
            <p id="timeTakenDisplay" style="font-weight: bold;"></p>
        </div>
    </div>
<div class="table-wrapper">
    <table id="dataTable" class="table table-bordered mt-3">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Profile</th>
                <th>Name</th>
                <th>City</th>
                <th>Mobile</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${datalist}" >
                <tr>
                    <td>${user.id}</td>
                    <td><img src="${pageContext.request.contextPath}/images/${user.image}" style="height: 40px;width: 40px" /></td>
                    <td>${user.name}</td>
                    <td>${user.city}</td>
                    <td>${user.mobile}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
var searchHistory = [];

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
    timeTakenDisplay.innerText = 'Time taken for search: ' + timeTaken.toFixed(2) + ' milliseconds';
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
                if (searchValue && !searchHistory.some(item => item.value === searchValue)) {
                    searchHistory.push({
                        value: nameValue,
                        image: imageSrc
                    });
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
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</body>
</html>
