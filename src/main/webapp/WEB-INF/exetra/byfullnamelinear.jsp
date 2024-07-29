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
        <tbody>
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

function filterTable() {
    // Start timing
    var startTime = performance.now();

    // Get the value of the search input
    var searchValue = document.getElementById('searchInput').value.toLowerCase();
    // Get the table and its rows
    var table = document.getElementById('dataTable');
    var rows = table.getElementsByTagName('tr');

    // Linear search algorithm: Loop through the table rows and hide those that don't match the search query
    for (var i = 1; i < rows.length; i++) { // Skip the header row
        var cells = rows[i].getElementsByTagName('td');
        var nameCell = cells[1]; // The name cell is the second cell in the row
        if (nameCell) {
            var nameValue = nameCell.textContent || nameCell.innerText;
            // Check if the search value is contained in the name value
            if (nameValue.toLowerCase().includes(searchValue)) {
                rows[i].style.display = '';
            } else {
                rows[i].style.display = 'none';
            }
        }
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
