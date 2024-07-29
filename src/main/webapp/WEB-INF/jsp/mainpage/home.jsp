<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS for additional styling -->
    <link rel="stylesheet" type="text/css" href="Dashboard/dashboard.css">
    
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/common/header.jsp" />
    
    <div class="container mt-5">
        <div class="row text-center">
            <div class="col-md-4">
                <div class="dashboard-col lightred-gradient">
                    <a href="customerPage" style="text-decoration: none">
                        <h3>Customer <span>${count}</span> </h3>
                        <p>Todays Customer:<span>${currentDateCustomers}</span> </p>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-col lightgreen-gradient">
                    <a href="venderlist" style="text-decoration: none">
                        <h3>Vendor <span>${vendorcount}</span></h3>
                        <p>Todays Vendor: <span>${currentDateVendor}</span></p>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-col lightblue-gradient">
                    <a href="productlists" style="text-decoration: none">
                        <h3>Product <span>${productcount}</span></h3>
                        <p>Todays Product: <span>${currentDateProduct}</span></p>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
