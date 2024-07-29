<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>

<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="login/loginandsignup/login.css">

</head>
<body>
<div class="container px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto" style="margin-top: 27px">
    <div class="card card0 border-0" style="border-radius: 10px">
        <div class="row d-flex">
            <div class="col-lg-6">
                <div class="card1 pb-5">
                    <div class="row">
                        <img src="${pageContext.request.contextPath}/logo/logo.png" class="logo">
                    </div>
                    <div class="row px-3 justify-content-center mt-4 mb-5 border-line">
                        <img src="${pageContext.request.contextPath}/images/image1.png" class="image">
                    </div>
                </div>
            </div>
            <div class="col-lg-6" style="background: #f0f5f770; margin-left: -16px">
                <form  class="card2 card border-0 px-4 py-5" action="login" method="post" style="background: #f7fafb;margin-top: 2em">
                    
                    <div class="row px-3 mb-4 ">
                        
                        
                        <span style="color: red;">${error}</span>
                       
                    </div>
                    <div class="row px-3">
                        <label class="mb-1"><h6 class="mb-0 text-sm">Email Address</h6></label>
                        <input class="mb-4 form-control" type="email" name="username" placeholder="email address" required>
                    </div>
                    <div class="row px-3">
                        <label class="mb-1"><h6 class="mb-0 text-sm">Password</h6></label>
                        <input type="password" name="password" class="form-control" placeholder=" password" required>
                    </div>
                    <div class="row px-3 mb-4">
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input id="chk1" type="checkbox" name="chk" class="custom-control-input"> 
                            <label for="chk1" class="custom-control-label text-sm">Remember me</label>
                        </div>
                        <a href="#" class="ml-auto mb-0 text-sm">Forgot Password?</a>
                    </div>
                    <div class="row mb-3 px-3">
                        <button type="submit" class="btn btn-blue btn-block" >Login</button>
                    </div>
                    <div class="row mb-4 px-3">
                        <small class="font-weight-bold" style="margin-left: 12em">Don't have an account? <a href="registerhere" class="text-danger">Register</a></small>
                    </div>
                </form>
            </div>
        </div>
       
    </div>
</div>
</body>
</html>
