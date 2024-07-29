<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bootstrap Table with JSTL</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <h2>Data Table</h2>
        </div>
        <div class="col-md-6">
            <form class="form-inline float-right" onsubmit="return false;">
                <input id="searchInput" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" onkeyup="checkEnter(event)">
                <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="filterTable()">Search</button>
            </form>
        </div>
    </div>

    <!-- Timing display -->
    <div class="row mt-3">
        <div class="col-md-12 text-center">
            <p id="timeTakenDisplay" style="font-weight: bold;"></p>
        </div>
    </div>

    <table id="dataTable" class="table table-bordered mt-3">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>City</th>
                <th>Mobile</th>
            </tr>
        </thead>
        <tbody id="tableBody">
            <c:forEach var="user" items="${datalist}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.city}</td>
                    <td>${user.mobile}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function checkEnter(event) {
    if (event.key === "Enter") {
        filterTable();
    }
}

function getSortedRows() {
    var table = document.getElementById('dataTable');
    var rows = Array.from(table.getElementsByTagName('tr'));
    rows = rows.slice(1); // Exclude header row
    rows.sort(function (a, b) {
        var nameA = a.getElementsByTagName('td')[1].textContent.toLowerCase();
        var nameB = b.getElementsByTagName('td')[1].textContent.toLowerCase();
        if (nameA < nameB) return -1;
        if (nameA > nameB) return 1;
        return 0;
    });
    return rows;
}

function binarySearch(rows, searchValue) {
    let left = 0;
    let right = rows.length - 1;
    while (left <= right) {
        let mid = Math.floor((left + right) / 2);
        let name = rows[mid].getElementsByTagName('td')[1].textContent.toLowerCase();
        if (name === searchValue) {
            return mid;
        } else if (name < searchValue) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1;
}

function filterTable() {
    // Start timing
    var startTime = performance.now();

    // Get the value of the search input
    var searchValue = document.getElementById('searchInput').value.toLowerCase();

    // Get sorted rows
    var rows = getSortedRows();

    // Perform binary search
    var foundIndex = binarySearch(rows, searchValue);

    // Hide all rows
    var tableBody = document.getElementById('tableBody');
    for (var row of rows) {
        row.style.display = 'none';
    }

    // Show only the found row, if any
    if (foundIndex !== -1) {
        rows[foundIndex].style.display = '';
    }

    // End timing
    var endTime = performance.now();
    var timeTaken = endTime - startTime;

    // Display the time taken in the top center of the table
    var timeTakenDisplay = document.getElementById('timeTakenDisplay');
    timeTakenDisplay.innerText = 'Time taken for search: ' + timeTaken.toFixed(2) + ' milliseconds';
}
</script>
</body>
</html>
