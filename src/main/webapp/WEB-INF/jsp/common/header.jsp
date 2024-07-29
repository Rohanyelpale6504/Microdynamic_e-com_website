<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap Navbar Example</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .nav-item .nav-link.active {
            color: #fff !important;
            border-radius: .25rem;
        }

        .navbar-nav .nav-item + .nav-item {
            margin-left: 1rem;
        }

        .navbar-light .navbar-nav .nav-link {
            color: #fff;
        }

        .navbar-light .navbar-nav .nav-link:hover {
            color: #070a0c;
        }

        .navbar-dark .navbar-nav .nav-link {
            color: #fff;
        }

        .navbar-dark .navbar-nav .nav-link:hover {
            color: #ddd;
        }
        .navbar{
        position: sticky;
        top: 0;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="z-index: 999px">
    <a class="navbar-brand" href="#">
    
        <img src="${pageContext.request.contextPath}/logo/logo.png" alt="Logo" style="width: 191px; height: 43px;">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" style="margin-left: 24em" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="homepage">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customerPage">Customer</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="venderlist">Vendor</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="productlists">Product</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Support</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Setting</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Help</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // Activate nav item on click
    $(document).ready(function () {
        $('.nav-item .nav-link').click(function () {
            $('.nav-item .nav-link').removeClass('active');
            $(this).addClass('active');
        });
    });
</script>
</body>
</html>
