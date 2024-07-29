<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="Dashboard/product/product.css">
    <style>
        .counter {
            display: flex;
            align-items: center;
        }
        .counter span {
            padding: 5px 10px;
            font-size: 16px;
            cursor: pointer;
        }
        .counter span.quantity {
            padding: 0 10px;
            font-size: 20px;
        }
        .card .remove-item {
            position: absolute;
            top: 5px;
            right: 5px;
            cursor: pointer;
            color: red;
            font-size: 18px;
        }
       
        .card-img {
            height: auto;
            width: 100%;
            max-height: 8em;
        }
        .card {
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 1rem;
            height: auto; /* Allow the height to adjust based on content */
        }
        .card-body {
            padding: 10px;
        }
        .order-summary {
            align-content: center;
            align-self: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 10px;
        }
        .order-summary h2, .order-summary h3 {
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }
        .order-summary p, .order-summary span {
            font-size: 1rem;
        }
        .btn-proceed-to-buy {
            color: white;
            background: darkgreen;
            width: 100%;
            margin-top: 1em;
            font-size: 1rem;
        }
        /* Adjusted input width */
        .quantity-input {
            width: 7%; /* Adjust width as needed */
            text-align: center;
        }
        .card-body{
        height: 10%;
        }
        .card-text{
        margin-bottom: 2px;
        }
        .innerbody{
        margin-left: 2em;
        }
         .xyzwapper{
        height: 450px;
        overflow-y:auto; 
         scrollbar-width: none; /* For Firefox */
    -ms-overflow-style: none;
        } 
        .shoppingcart{
        display: flex;
        justify-content: space-between;
        }
        .dele{
        background: #fff;
        color: red;
        border-radius: 7px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        font-size: .8em;
        }
         .popup-warning {
            position: fixed;
            top: 1rem;
            right: 1rem;
            background: orange;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            display: none;
        }
        

        

        @keyframes loading {
            from { width: 100%; }
            to { width: 0; }
        }
       
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/common/header.jsp" %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="position: sticky;top:4em;z-index: 999px ">
        <a class="navbar-brand" href="homepage" style="color: green">
            <i class="fa fa-home" aria-hidden="true"></i>
        </a>
        <div class="collapse navbar-collapse justify-content-center" style="margin-left: 11em" id="navbarNav">
            <div class="form-inline inputBox">
                <div class="dropdown">
                    <input id="searchInput" style="width: 166%;" class="form-control dropdown-toggle" type="search" placeholder="Search" aria-label="Search" data-toggle="dropdown" onkeyup="filterTable(); showSearchHistory()">
                    <div id="searchHistoryList" style="width: 171%; margin-right: -9.3em;" class="dropdown-menu"></div>
                </div>
                <button class="btn  btn-outline-success my-2 my-sm-0" type="button" style="margin-left: 10em" onclick="addSearchHistory()">Search</button>
            </div>
        </div>
        <div class="navbar-nav ml-auto">
            <div id="messageContainer"></div>
            <div class="loader" id="loader"></div>
            <a href="showcart" style="color: green; margin-right: 2em; font-size: 1.5rem" onclick="location.reload()">
                <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                <span id="cartItemCount" class="badge badge-pill badge-success">${cartcount}</span>
            </a>
            <a class="nav-item nav-link btn btn-outline-success" style="color: green" href="productf">
                Add Product
            </a>
        </div>
    </nav>
    <div class="container mt-4" >
        <div class="row" style="z-index: -999px">
            <div class="col-md-8">
                
                <div id="cartDisplay">
                    <form class="shoppingcart" action="${pageContext.request.contextPath}/deleteAlldata" method="post">
                        <h6>Shopping Cart</h6>
                        <button type="submit" class="btn  dele mb-3" style="color: red;font-size: .8em;">CLEAR CART</button>
                    </form>
                   <div class="xyzwapper">
                        <c:choose>
                            <c:when test="${empty cartData}">
                                <!-- Display message and icon when cart is empty -->
                                <div class="text-center mt-5">
                                    <img src="${pageContext.request.contextPath}/logo/cart.png" alt="Logo" style="width: 70%; height: 386px;">
                                    
                                </div>
                            </c:when>
                            <c:otherwise>
                                <!-- Iterate over cart items if cart is not empty -->
                                <c:forEach var="cartItem" items="${cartData}">
                                    <!-- Display each cart item -->
                                    <div class="card mb-3">
                                        <div class="row no-gutters">
                                            <div class="col-md-4">
                                                <img src="data:image/jpeg;base64,${cartItem.picture}" class="card-img" alt="${cartItem.name}">
                                            </div>
                                            <div class="col-md-8">
                                                <div class="innerbody">
                                                <p style="display: none" class="product-id" id="cartid"> ${cartItem.productid}</p>
                                                    <h5 class="card-title" style="font-size: 1rem;">${cartItem.name}</h5>
                                                    <p class="card-text" style="font-size: 0.9rem;">${cartItem.summary}</p>
                                                    <p class="card-text" style="font-size: 0.9rem;">Price: $<span id="price_${cartItem.productid}">${cartItem.price}</span></p>
                                                    <div class="counter">
                                                        <button class="btn-success" onclick="updateQuantity(${cartItem.productid}, -1)">-</button>
                                                        <input id="quantity_${cartItem.productid}" type="text" class="quantity-input" value="1">
                                                        <button class="btn-success" onclick="updateQuantity(${cartItem.productid}, 1)">+</button>
                                                    </div>
                                                    <p class="card-text" style="font-size: 0.9rem;">Total: $<span id="total_${cartItem.productid}">${cartItem.price}</span></p>
                                                </div>
                                            </div>
                                            <form action="deleteCart/${cartItem.productid}" method="post" class="remove-item">
                                                <button type="submit" class="btn btn-link">&times;</button>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
           <div class="col-md-4 order-summary">
    <h2>Order Summary</h2>
    <p>Total Items: <span style="margin-left: 15em">${cartcount}</span></p><hr>
    <h3>Total Cart Price: <span id="cartTotal" style="margin-left: 8em">0.00</span></h3> 
    <button class="btn btn-proceed-to-buy btn-success" type="button"  onclick="proceedToBuy()">Proceed To Buy</button>
</div>
</div>
</div>

<div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="paymentModalLabel">Payment Type</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/addpaymentdetails" method="post">
                    <input type="hidden" class="form-control" value="${cartcount}" name="totalproduct">

                    <div class="form-group" style="display: flex; justify-content: space-between;">
                        <h5>Total Price:</h5>
                        <input type="text" id="totalPrice" class="form-control" name="totalpayment" style="border: none; background: white; color: green; font-size: 1em; width: 20%" readonly>
                    </div>
                    <hr>
                    <div class="form-group">
                        <h5>Payment Method:</h5>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymenttype" value="Cash on Delivery" checked>
                            <label class="form-check-label" for="cod">Cash on Delivery</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymenttype" value="Online">
                            <label class="form-check-label" for="online">Online</label>
                        </div>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-success" style="float:right;">Next</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="popupWarning" class="popup-warning">Your cart is empty!
<div class="loading-bar" style="background: red"></div>
</div>
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="Dashboard/product/product.js"></script>
    <script>
    // Proceed to Buy functionality
    var productIds = [];
function proceedToBuy() {
    if (${cartcount} === 0) {
        showWarningPopup();
    } else {
        var totalCartPrice = document.getElementById('cartTotal').innerText;
        document.getElementById('totalPrice').value = totalCartPrice;
         $('#checkoutModal').modal('show');
    }
}

  // Show warning popup
    function showWarningPopup() {
        var popup = document.getElementById('popupWarning');
        popup.style.display = 'block';
        setTimeout(function() {
            popup.style.display = 'none';
        }, 3000); // Show for 3 seconds
    }
    
        function updateQuantity(productId, change) {
            let quantityElement = document.getElementById('quantity_' + productId);
            let priceElement = document.getElementById('price_' + productId);
            let totalElement = document.getElementById('total_' + productId);

            let quantity = parseInt(quantityElement.value) + change;
            if (quantity < 0) {
                quantity = 0;
            }
            quantityElement.value = quantity;

            // Check if quantity is greater than zero before updating total price
            if (quantity > 0) {
                let price = parseFloat(priceElement.innerText);
                let total = quantity * price;
                totalElement.innerText = total.toFixed(2);
            }

            updateCartSummary(); // Update cart summary after each quantity change
        }

        function updateCartSummary() {
            let cartTotal = 0;
            let totalItems = 0;

            document.querySelectorAll('[id^="total_"]').forEach(function(element) {
                cartTotal += parseFloat(element.innerText);
            });
            document.querySelectorAll('[id^="quantity_"]').forEach(function(element) {
                totalItems += parseInt(element.value);
            });

            let cartTotalElement = document.getElementById('cartTotal');
            let totalItemsElement = document.getElementById('totalItems');
            
            cartTotalElement.innerText = cartTotal.toFixed(2);
            totalItemsElement.innerText = totalItems;
        }
        
        function updateModalTotalPrice() {
            var totalCartPrice = document.getElementById('totalCartPrice').textContent;
            document.getElementById('totalPrice').value = totalCartPrice;
        }
        // Calculate initial total items and total cart price on page load
        document.addEventListener('DOMContentLoaded', function() {
            updateCartSummary(); // Initial calculation on page load
        });
    </script>
</body>
</html>
