<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Table with JSTL</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="Dashboard/customer/customers.css">
    <style>
        /* Custom styles can be added here */
        .table-wrapper {
            overflow-y: auto; /* Enable vertical scrolling */
        }
        /* Customize table headers */
        .thead-dark th {
            background-color: #343a40; /* Dark background color for table headers */
            color: white; /* Text color for table headers */
        }
        /* Optional: Style for edit icon */
        .edit-icon {
            text-decoration: none;
            color: black;
        }
        .edit-icon:hover {
            color: #007bff; /* Change color on hover */
        }
         .table tbody tr:nth-of-type(odd) {
      background-color: #f8f9fa; /* Alternate row background color */
    }
     .table tbody tr:hover {
      background-color: #e9ecef; /* Hover row background color */
    }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/common/header.jsp" />
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="homepage" style="color: green">
        <i class="fa fa-home" aria-hidden="true"></i>
    </a>
    <div class="collapse navbar-collapse justify-content-center" style="margin-left: 11em" id="navbarNav">
        <div class="form-inline inputBox">
            <div class="dropdown">
                <input id="searchInput" class="form-control dropdown-toggle" type="search" placeholder="Search" aria-label="Search" data-toggle="dropdown" onkeyup="filterTable(); showSearchHistory()">
                <div id="searchHistoryList" style="width: 171%; margin-right: -9.3em;" class="dropdown-menu"></div>
            </div>
            <button class="btn btn-outline-success my-2 my-sm-0" type="button" style="margin-left: 10em" onclick="addSearchHistory()">Search</button>
        </div>
    </div>
    <div class="navbar-nav ml-auto">
        <div id="messageContainer"></div>
        <div class="loader" id="loader"></div>
        <a href="showcart" style="color: green; margin-right: 2em; font-size: 1.5rem; position: relative;" onclick="location.reload()">
            <i class="fa fa-shopping-bag" aria-hidden="true"></i>
            <span id="cartItemCount" class="badge badge-pill badge-success" style="position: absolute; top: 0px; right: -15px; font-size: 9px; background: indianred;">${cartcount}</span>
        </a>
        <a class="nav-item nav-link btn btn-outline-success" style="color: green" href="#" onclick="document.getElementById('fileInput').click();">
            <i class="fa fa-upload"></i> Upload
        </a>
    </div>
</nav>

<form id="uploadForm" action="/upload" method="POST" enctype="multipart/form-data" style="display: none;">
    <input type="file" id="fileInput" accept="*/*" name="file" onchange="handleFileUpload(event);">
</form>

<div class="container-fluid mt-5">
    <!-- Timing display -->
    <div class="row mt-3">
        <div class="col-md-12 text-center">
            <span id="timeTakenDisplay" style="font-weight: 500;color:lightgrey"></span>
        </div>
    </div>
    <div class="table-wrapper" style="height: 61vh; overflow-y: auto;">
        <table id="dataTable" class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Profile</th>
                    <th>Name</th>
                    <th>City</th>
                    <th>Mobile</th>
                    <th>Action</th> <!-- Added Action column header -->
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${datalist}">
                    <tr>
                        <td>${user.id}</td>
                        <td><img src="${pageContext.request.contextPath}/images/${user.image}" style="height: 40px; width: 40px;" /></td>
                        <td>${user.name}</td>
                        <td>${user.city}</td>
                        <td>${user.mobile}</td>
                        <td>
                            <div class="dropdown">
                                <a class="edit-icon ml-2" href="#" onclick="editUser('${user.id}','${user.image}', '${user.name}', '${user.city}', '${user.mobile}')" data-toggle="modal" data-target="#updateModal">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Include modal for editing user -->
    <jsp:include page="/WEB-INF/jsp/modal/customermodal.jsp"></jsp:include>
</div>

<!-- Include your custom JavaScript file -->
<script src="Dashboard/customer/customersandall.js"></script>
<!-- Add jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
