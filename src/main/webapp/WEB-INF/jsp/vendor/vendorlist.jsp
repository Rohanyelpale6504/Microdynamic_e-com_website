<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Company Details</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <!-- Custom CSS -->
  <link rel="stylesheet" type="text/css" href="Dashboard/vendor/vender.css" />
  <style>
    .badge {
      background-color: darkred;
      margin: -10px 0 0 -10px;
      color: white;
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
                <input id="searchInput" style="width: 171%;" class="form-control dropdown-toggle" type="search" placeholder="Search" aria-label="Search" data-toggle="dropdown" onkeyup="filterTable(); showSearchHistory()">
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
            <span id="cartItemCount" class="badge badge-pill badge-success" style="position: absolute; top: 10px; right: -12px; font-size: 9px; background: indianred;">${cartcount}</span>
        </a>
        <a class="nav-item nav-link btn btn-outline-success" style="color: green" href="productf">
            Add Product
        </a>
    </div>
</nav>
<div class="container-fluid mt-4">
    <h2>Company Details</h2>
    <!-- Table Wrapper -->
    <div class="table-wrapper">
      <table class="table table-bordered table-striped mt-3">
        <thead class="bg-dark">
          <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Contact No</th>
            <th>Office Contact</th>
            <th>Address</th>
            <th>GST No</th>
            <th>Company Name</th>
            <th>Nature of Business</th>
            <th>Turnover</th>
            <th>List of Services</th>
            <th>List of Products</th>
            <th>Credit Limit</th>
            <th>Status</th>
            <th>Date</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody id="companyTableBody">
          <c:forEach var="company" items="${vendors}">
            <tr>
              <td>${company.id}</td>
              <td>${company.name}</td>
              <td>${company.mobile}</td>
              <td>${company.officemobile}</td>
              <td>${company.address}</td>
              <td>${company.gstno}</td>
              <td>${company.companyname}</td>
              <td>${company.businessnature}</td>
              <td>${company.turnover}</td>
              <td>${company.service}</td>
              <td>${company.product}</td>
              <td>${company.creditlimit}</td>
              <td>${company.status}</td>
              <td>${company.date}</td>
              <td>
                <a href="#" onclick="editCompany('${company.id}', '${company.name}', '${company.mobile}', '${company.officemobile}', '${company.address}', '${company.gstno}', '${company.companyname}', '${company.businessnature}', '${company.turnover}', '${company.service}', '${company.product}', '${company.creditlimit}', '${company.status}')" data-toggle="modal" data-target="#popupModal" style="text-decoration: none; color: black;">
                  <i class="fas fa-edit edit-icon" title="Edit"></i>
                </a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
</div>

<!-- Modal -->
<jsp:include page="/WEB-INF/jsp/modal/vendormodal.jsp"></jsp:include>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<!-- Your custom script for search and highlight -->
<script type="text/javascript" src="/Dashboard/vendor/vendor.js"></script>
</body>
</html>
