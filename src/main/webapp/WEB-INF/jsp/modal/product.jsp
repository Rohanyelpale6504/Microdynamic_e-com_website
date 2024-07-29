<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="popupForm" tabindex="-1" role="dialog" aria-labelledby="popupFormLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="width: 681px">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="popupFormLabel">Product Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="productForm" action="/updateproduct" method="post">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <img id="productPicturePreview" src="" alt="Product Image" style="max-width: 80px; border-radius: 10%;">
                            </div>
                            <div class="form-group">
                                <label for="productId">Product ID:</label>
                                <input type="text" class="form-control" id="productId" name="id" readonly>
                            </div>
                            <div class="form-group">
                                <label for="productName">Name:</label>
                                <input type="text" class="form-control" id="productName" name="name">
                            </div>
                            <div class="form-group">
                                <label for="productQuantity">Available Quantity:</label>
                                <input type="number" class="form-control" id="productQuantity" name="quantity">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="productSummary">Summary:</label>
                                <textarea class="form-control" id="productSummary" rows="3" name="summary"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="productPrice">Price:</label>
                                <input type="number" class="form-control" id="productPrice" name="price">
                            </div>
                            <div class="form-group">
                                <label for="productDate">Date:</label>
                                <input type="text" class="form-control" id="productDate" name="updateddate" readonly>
                            </div>
                            <div class="form-group">
                                <label for="productAvailable">Product Available:</label>
                                <input type="text" class="form-control" id="productAvailable" name="available">
                            </div>
                            <div class="form-group">
                                <label for="productRating">Rating Scale:</label>
                                <input type="number" class="form-control" id="productRating" name="rating">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
// Function to fill modal with product details
function fillProductModal(id, name, picture, summary, quantity, price, available, rating) {
    document.getElementById('productId').value = id;
    document.getElementById('productName').value = name;
    document.getElementById('productSummary').value = summary;
    document.getElementById('productQuantity').value = quantity;
    document.getElementById('productPrice').value = price;
    document.getElementById('productAvailable').value = available;
    document.getElementById('productRating').value = rating;
    document.getElementById('productPicturePreview').src = 'data:image/jpeg;base64,' + picture;
    var currentDate = new Date().toISOString().split('T')[0];
    document.getElementById('productDate').value = currentDate;
}

</script>
</body>
</html>