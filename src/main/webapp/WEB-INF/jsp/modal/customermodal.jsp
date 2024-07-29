<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="width: 681px">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalLabel"><center>Update User Information</center></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateForm" action="update" method="post">
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <img id="profileImg" src="" alt="Profile Photo" style="max-width: 100px; max-height: 100px;border-radius: 50%">
                            <br>
                            <label for="profile">Profile Photo</label>
                        </div>
                        <div class="col-sm-8">
                            <label for="userId">User ID</label>
                            <input type="text" class="form-control" id="userId" name="id" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="form-group col-sm-6">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" pattern="[A-Za-z\s]+" name="name">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="city">City</label>
                            <input type="text" class="form-control" id="city" name="city">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="form-group col-sm-6">
                            <label for="mobile">Mobile</label>
                            <input type="tel" class="form-control" id="mobile" pattern="\d{10}" maxlength="10" name="mobile">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="date">Date</label>
                            <input type="date" class="form-control" id="date" name="updateddate" readonly>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
function editUser(id, image, name, city, mobile) {
    document.getElementById('userId').value = id;
    document.getElementById('name').value = name;
    document.getElementById('city').value = city;
    document.getElementById('mobile').value = mobile;
    document.getElementById('profileImg').src = "${pageContext.request.contextPath}/images/" + image; // Set profile image src
    
    // Set current date in the date input field
    var currentDate = new Date().toISOString().split('T')[0];
    document.getElementById('date').value = currentDate;
}

</script> 
</body>
</html>