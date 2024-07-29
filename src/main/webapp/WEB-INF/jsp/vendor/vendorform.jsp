<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Vendor</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    /* Custom styling for form */
    .custom-form {
      max-width: 100%;
      margin: 5% auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      position: relative;
      background: #f4f6f6; /* Light gray background */
      z-index: -1;
    }
    .custom-form h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    .form-control {
      height: 2em;
      padding: 0.25rem 0.5rem;
    }
    .custom-form textarea.form-control {
      height: auto;
    }
    .alert {
      position: fixed;
      top: 10px;
      right: 10px;
      z-index: 10;
    }
    
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/common/header.jsp" />
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="custom-form">
      <div id="companyForm" ></div>
        <h2>Company Details</h2>
        <form  action="${pageContext.request.contextPath}/addvendor" method="post" onsubmit="return validateForm()">
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="name">Name <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="name" name="name" placeholder="Enter name" required>
            </div>
            <div class="form-group col-md-4">
              <label for="mobile">Contact No <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="mobile" name="mobile" pattern="\d{10}" maxlength="10" placeholder="Enter contact number" required>
            </div>
            <div class="form-group col-md-4">
              <label for="officeMobile">Office Contact <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="officeMobile" name="officemobile" pattern="\d{10}" maxlength="10" placeholder="Enter office contact number" required>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="address">Address <span class="text-danger">*</span></label>
              <textarea class="form-control" id="address" name="address" placeholder="Enter address" required></textarea>
            </div>
            <div class="form-group col-md-4">
              <label for="gstNo">GST No <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="gstNo" name="gstno" placeholder="Enter GST number (e.g., 22AAAAA0000A1Z5)" required>
            </div>
            <div class="form-group col-md-4">
              <label for="companyName">Company Name <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="companyname" name="companyname" placeholder="Enter company name" required>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="businessNature">Nature of Business <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="businessnature" name="businessnature" placeholder="Enter nature of business" required>
            </div>
            <div class="form-group col-md-4">
              <label for="turnover">Turnover <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="turnover" name="turnover" placeholder="Enter turnover" required>
            </div>
            <div class="form-group col-md-4">
              <label for="service">List of Services <span class="text-danger">*</span></label>
              <textarea class="form-control" id="service" name="service" placeholder="Enter list of services" required></textarea>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="product">List of Products <span class="text-danger">*</span></label>
              <textarea class="form-control" id="product" name="product" placeholder="Enter list of products" required></textarea>
            </div>
            <div class="form-group col-md-4">
              <label for="creditLimit">Credit Limit <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="creditlimit" name="creditlimit" placeholder="Enter credit limit" required>
            </div>
            <div class="form-group col-md-4">
              <label for="status">Status <span class="text-danger">*</span></label>
              <select class="form-control" id="status" name="status" required>
                <option>Active</option>
                <option>Inactive</option>
              </select>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="date">Date <span class="text-danger">*</span></label>
              <input type="date" class="form-control" id="date" name="date" value="${date}" required>
            </div> 
          </div>
          <button style="width: 100%;background: green" type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- JavaScript for success popup -->
<script>
  function validateForm() {
    // Add validation logic if needed
    // For now, always return true to submit the form
    return true;
  }

  // Show success alert for 3 seconds
  $(document).ready(function() {
    $('#companyForm').submit(function() {
      $('.alert').remove(); // Remove existing alerts
      $(this).prepend('<div class="alert alert-success" role="alert">Form submitted successfully!</div>');
      setTimeout(function() {
        $('.alert').fadeOut('slow');
      }, 5000); // 3 seconds
    });
  });
</script>

</body>
</html>
