<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="Dashboard/product/product.css">
    <style>
        .alert-popup {
            position: fixed;
            top: -7em;
            right: 10px;
            width: 20vw;
            z-index: 9999; /* increase z-index to ensure visibility */
            display: none;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            float: right;
             
        }

        .success-slide-in, .warning-slide-in {
            animation: slideIn 0.5s forwards;
            scrollbar-width: none; /* For Firefox */
    -ms-overflow-style: none;
        }

        .success-slide-out, .warning-slide-out {
            animation: slideOut 0.5s forwards;
            scrollbar-width: none; /* For Firefox */
    -ms-overflow-style: none;
        }

        @keyframes slideIn {
            from { right: -20px; opacity: 0;
            
             }
            to { right: 10px; opacity: 1; },
            
        }

        @keyframes slideOut {
            from { right: 10px; opacity: 1; }
            to { right: -20px; opacity: 0; }
        }

        .alert-popup .loading-bar {
            position: absolute;
            bottom: 0;
            left: 0;
            height: 4px;
            background: #28a745;
            animation: loading 3s linear;
        }

        

        @keyframes loading {
            from { width: 100%; }
            to { width: 0; }
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
                    <input id="searchInput" style="width: 166%;" class="form-control dropdown-toggle" type="search" placeholder="Search" aria-label="Search" data-toggle="dropdown" onkeyup="filterTable(); showSearchHistory()">
                    <div id="searchHistoryList" style="width: 171%; margin-right: -9.3em;" class="dropdown-menu"></div>
                </div>
                <button class="btn btn-outline-success my-2 my-sm-0" type="button" style="margin-left: 10em" onclick="addSearchHistory()">Search</button>
            </div>
        </div>
        <div class="navbar-nav ml-auto">
            <div id="messageContainer"></div>
            <div class="loader" id="loader"></div>
            <a href="showcart" style="color: green; margin-right: 2em; font-size: 23px" onclick="location.reload()">
                <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                <span id="cartItemCount" class="badge badge-pill badge-success">${cartcount}</span>
            </a>
            <a class="nav-item nav-link btn btn-outline-success" style="color: green" href="productf">
                Add Product
            </a>
        </div>
    </nav>

    <!-- Success and Error Messages -->
    <div id="successMessage" class="alert  alert-popup" style="background: lightgreen">
        <i class="fas fa-check-circle"></i> ${success}
        <div class="loading-bar"></div>
    </div>
    <div id="errorMessage" class="alert alert-danger warning alert-popup" style="background: lightorange;">
        <i class="fas fa-exclamation-triangle"></i> ${error}
        <div class="loading-bar" style="background: red"></div>
    </div>

    <div class="container-fluid mt-4">
        <h2>Product List</h2>
        <div class="table-wrapper">
            <table class="table table-striped custom-table">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Picture</th>
                        <th>Name</th>
                        <th>Summary</th>
                        <th>Available Quantity</th>
                        <th>Price</th>
                        <th>Product Available</th>
                        <th>Rating Scale</th>
                        <th>Action</th>
                        <th>Add Cart</th>
                    </tr>
                </thead>
                <tbody id="productTable">
                    <c:forEach var="product" items="${listProduct}">
                        <tr>
                            <td>${product.id}</td>
                            <td>
                                <img src="data:image/jpeg;base64,${product.picture}" alt="Product Image" style="max-width: 80px; border-radius: 10%;">
                            </td>
                            <td>${product.name}</td>
                            <td>${product.summary}</td>
                            <td>${product.quantity}</td>
                            <td>${product.price}</td>
                            <td>${product.available}</td>
                            <td>${product.rating}</td>
                            <td>
                                <a href="#" onclick="fillProductModal('${product.id}', '${product.name}', '${product.picture}', '${product.summary}', '${product.quantity}', '${product.price}', '${product.available}', '${product.rating}')" data-toggle="modal" data-target="#popupForm">
                                    <i class="fas fa-edit edit-icon" style="color: #000;" title="Edit"></i>
                                </a>
                            </td>
                            <td>
                                <form action="/addcartdata/${product.id}" method="post">
                                    <input type="hidden" name="id" value="${product.id}">
                                    <input type="hidden" name="name" value="${product.name}">
                                    <input type="hidden" name="picture" value="${product.picture}">
                                    <input type="hidden" name="summary" value="${product.summary}">
                                    <input type="hidden" name="price" value="${product.price}">
                                    <button type="submit" style="font-size: 14px; font-weight: 600;">
                                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <jsp:include page="/WEB-INF/jsp/modal/product.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="Dashboard/product/product.js"></script>

    <script>
        $(document).ready(function() {
            var successMessage = $('#successMessage');
            var errorMessage = $('#errorMessage');

            if (successMessage.text().trim() !== "") {
                successMessage.addClass('success-slide-in').show();
                setTimeout(function() {
                    successMessage.removeClass('success-slide-in').addClass('success-slide-out');
                    setTimeout(function() {
                        successMessage.hide();
                    }, 500); // Adjust to match slideOut animation duration
                }, 3000);
            }

            if (errorMessage.text().trim() !== "") {
                errorMessage.addClass('warning-slide-in').show();
                setTimeout(function() {
                    errorMessage.removeClass('warning-slide-in').addClass('warning-slide-out');
                    setTimeout(function() {
                        errorMessage.hide();
                    }, 500); // Adjust to match slideOut animation duration
                }, 3000);
            }
        });
    </script>
</body>
</html>
