<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shopping Cart</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .cart-container, .cart-containers {
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin-bottom: 20px;
      background-color: white;
    }
    .cart-container .row > .col {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .cart-container .btn-primary {
      background-color: white;
      color: black;
      border-color: #007bff;
    }
    .cart-container .btn-primary:hover {
      background-color: #007bff;
      color: white;
    }
    .cart-container .btn-success {
      background-color: orange;
      border-color: orange;
    }
    .cart-container .btn-success:hover {
      background-color: #e67e22;
    }
    .container-fluid {
      align-content: center;
      min-height: 70vh;
    }
    .cart-items {
      display: flex;
      flex-direction: column;
      gap: 15px;
      padding-bottom: 10px;
    }
    .cart-items .card {
      width: 100%;
      height: auto;
      font-size: 0.7rem;
    }
    .cart-items .info {
      width: 100%;
      padding: 10px;
    }
    .cart-items img {
      max-height: 120px;
      object-fit: cover;
    }
    .cart-items .card-body {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    .col-md-8, .col-md-4 {
      min-height: 18.4vh;
    }
    .cart-items .card-title {
      font-size: .8rem;
    }
    p {
      margin-bottom: 0;
    }
    .footer {
      background-color: #f8f9fa;
      padding: 20px;
      position: fixed;
      bottom: 0;
      width: 100%;
      border-top: 1px solid #e0e0e0;
    }
    .footer a {
      color: #007bff;
      text-decoration: none;
    }
    .footer a:hover {
      text-decoration: underline;
    }
    .navbar{
      z-index: 10;
    }
    .cart-container, .cart-containers, .container-fluid {
      z-index: -1;
    }
  </style>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>
<nav class="navbar navbar-expand-lg" style="background: #f8f9fa;position: sticky;top: 4em;">
    <a class="navbar-brand" href="homepage" style="color: green">
        <i class="fa fa-home" aria-hidden="true"></i>
    </a>
    <div class="collapse navbar-collapse justify-content-center" style="margin-left: 5em" id="navbarNav">
        <div class="form-inline inputBox">
            <div class="dropdown">
                <input id="searchInput" class="form-control dropdown-toggle" type="search" placeholder="Search" aria-label="Search" data-toggle="dropdown" onkeyup="filterTable(); showSearchHistory()" style="width: 174%">
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
<div class="container" style="margin-top: 2em">
  <div class="row">
    <div class="col-md-12">
      <div class="cart-container">
        <div class="row">
          <div class="col">
            <h4>My ORDER (${cartcount})</h4>
            <a href="#" style="color: grey; text-decoration: none"><i class="fa fa-map-marker" style="color: black" aria-hidden="true"></i>&nbsp;&nbsp;Enter Delivery Pincode &nbsp;&nbsp;&nbsp;<span style="color: blue;">Check</span></a>
          </div>
        </div>
        <hr>
        <!-- Vertical section for cart items -->
        <div class="row">
          <div class="col-8 cart-items">
            <c:forEach var="item" items="${cartData}">
              <div class="card">
                <div class="row no-gutters">
                  <div class="col-md-4">
                    <img src="data:image/jpeg;base64,${item.picture}" class="card-img" alt="${item.name}">
                  </div>
                  <div class="col-md-8">
                    <div class="card-body">
                      <h6 style="margin-bottom: 0px">${item.name}</h6>
                      <p style="margin-bottom: 0px">${item.summary}</p>
                      <p style="margin-bottom: 0px">Price: <i class="fa fa-inr" aria-hidden="true"></i>${item.price}</p>
                      <a href="#" style="color: black">REMOVE</a>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
          <div class="col-4 info">
            <p>Free Delivery in 3-4 days</p>
          </div>
        </div>
        <hr>
        <!-- Buttons -->
        <div class="row">
          <div class="col d-flex justify-content-end">
          
            <a href="productlists" class="btn btn-primary"><i class="fa fa-angle-left" style="font-size: .8rem" aria-hidden="true"></i>&nbsp;&nbsp;Continue Shopping</a>
       <form action="${pageContext.request.contextPath}/generateInvoice/${loginId}" method="get">
    <input type="hidden" name="id" value="${loginId}">
    <button type="submit" class="btn btn-primary ml-3">Generate Invoice</button>
</form>
            <a href="#" class="btn btn-success ml-3">Place Order</a>
            
          </div>
        </div>
      </div>
    </div>
   <%--  <div class="col-md-4">
      <div class="cart-containers">
        <div class="row">
          <div class="col">
            <h4 style="color: gray;">PRICE DETAILS</h4>
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <p>Price (${cartcount} items)<span style="float: right;color: green">${totalPayment}</span></p>
            <p>Delivery Charges <span style="float: right; color: green; font-weight: bold;">FREE</span></p>
          </div>
        </div>
        <hr>
        <div class="row">
          <div class="col">
            <p><strong>Amount Payable</strong><span style="float: right;color: green"><i class="fa fa-inr" aria-hidden="true"></i>${totalPayment}</span></p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col d-flex justify-content-center">
          <i class="bi bi-shield-lock-fill" style="font-size: 2em; color: green; margin-top: 1em;"></i>
        </div>
      </div>
    </div> --%>
  </div>
</div>
<!-- Footer -->
<!-- <div class="footer">
  <div class="container">
    <div class="row">
      <div class="col text-center">
        <p>&copy; 2024 Your Company | <a href="#">Privacy Policy</a></p>
      </div>
    </div>
  </div>
</div> -->
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="path/to/your/custom.js"></script>
</body>
</html>
