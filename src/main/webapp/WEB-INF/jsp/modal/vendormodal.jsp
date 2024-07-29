<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="popupModal" tabindex="-1" role="dialog" aria-labelledby="popupModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="popupModalLabel">Edit Company</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form class="popup-form" action="updateVendor" method="post">
            <div class="form-row">
              <div class="form-group col-md-4">
                <label for="id">ID</label>
                <input type="text" class="form-control" id="id" name="id" readonly>
              </div>
              <div class="form-group col-md-4">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name">
              </div>
              <div class="form-group col-md-4">
                <label for="contactNo">Contact No</label>
                <input type="tel" class="form-control" id="contactNo" name="mobile" maxlength="10">
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-4">
                <label for="officeContact">Office Contact</label>
                <input type="tel" class="form-control" id="officeContact" name="officemobile" maxlength="10">
              </div>
              <div class="form-group col-md-4">
                <label for="address">Address</label>
                <input type="text" class="form-control" id="address" name="address">
              </div>
              <div class="form-group col-md-4">
                <label for="gstNo">GST No</label>
                <input type="text" class="form-control" id="gstNo" name="gstno">
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-4">
                <label for="companyName">Company Name</label>
                <input type="text" class="form-control" id="companyName" name="companyname">
              </div>
              <div class="form-group col-md-4">
                <label for="natureOfBusiness">Nature of Business</label>
                <input type="text" class="form-control" id="natureOfBusiness" name="businessnature">
              </div>
              <div class="form-group col-md-4">
                <label for="turnover">Turnover</label>
                <input type="text" class="form-control" id="turnover" name="turnover">
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-4">
                <label for="listOfServices">List of Services</label>
                <input type="text" class="form-control" id="listOfServices" name="service">
              </div>
              <div class="form-group col-md-4">
                <label for="listOfProducts">List of Products</label>
                <input type="text" class="form-control" id="listOfProducts" name="product">
              </div>
              <div class="form-group col-md-4">
                <label for="creditLimit">Credit Limit</label>
                <input type="text" class="form-control" id="creditLimit" name="creditlimit">
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-4">
                <label for="status">Status</label>
                <input type="text" class="form-control" id="status" name="status">
              </div>
              <div class="form-group col-md-4">
                <label for="date">Date</label>
                <input type="text" class="form-control" id="updatedate" name="updatedate" readonly>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
          </form>
        </div>
      </div>
    </div>
</div>
<script type="text/javascript">
function editCompany(id, name, contactNo, officeContact, address, gstNo, companyName, natureOfBusiness, turnover, listOfServices, listOfProducts, creditLimit, status, updatedate) {
    document.getElementById('id').value = id;
    document.getElementById('name').value = name;
    document.getElementById('contactNo').value = contactNo;
    document.getElementById('officeContact').value = officeContact;
    document.getElementById('address').value = address;
    document.getElementById('gstNo').value = gstNo;
    document.getElementById('companyName').value = companyName;
    document.getElementById('natureOfBusiness').value = natureOfBusiness;
    document.getElementById('turnover').value = turnover;
    document.getElementById('listOfServices').value = listOfServices;
    document.getElementById('listOfProducts').value = listOfProducts;
    document.getElementById('creditLimit').value = creditLimit;
    document.getElementById('status').value = status;
    var currentDate = new Date().toISOString().split('T')[0];
    document.getElementById('updatedate').value = currentDate;
  }

</script>
</body>
</html>