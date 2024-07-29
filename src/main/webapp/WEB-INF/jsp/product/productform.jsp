<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .custom-file-input {
            overflow: hidden;
            position: relative;
            width: 100%;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            cursor: pointer;
        }
        .custom-file-input input[type="file"] {
            position: absolute;
            top: 0;
            right: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }
        .form-container {
            background-color: #f8f9fa; /* Light gray background */
            border: 1px solid #ced4da; /* Gray border */
            box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Soft box shadow */
            padding: 20px;
            margin-top: 20px;
            border-radius: 0.50rem;
            width: 90%;
            margin-left: 2em
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/common/header.jsp" />
    <div class="container">

        <div class="form-container">
            <form:form action="${pageContext.request.contextPath}/addproduct" method="post" enctype="multipart/form-data" class="form-horizontal">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="name">Product Name:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="summary">Summary:</label>
                        <input type="text" class="form-control" id="summary" name="summary" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="quantity">Quantity:</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="price">Price:</label>
                        <input type="number" step="0.01" class="form-control" id="price" name="price" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="available">Available:</label>
                        <select class="form-control" id="available" name="available" required>
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="rating">Rating:</label>
                        <input type="number" step="0.1" class="form-control" id="rating" name="rating" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="picture">Picture:</label>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="picture" name="picture" required>
                        <label class="custom-file-label" for="picture">Choose file</label>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
        </div>
    </div>

    <script>
        // Update file input label to display selected file name
        $('.custom-file-input').on('change', function() {
            var fileName = $(this).val().split('\\').pop();
            $(this).next('.custom-file-label').html(fileName);
        });
    </script>
</body>
</html>
