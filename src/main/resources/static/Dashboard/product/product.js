/**
 * 
 */
 function filterTable() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("productTable");
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[2]; // Index 2 is the column for product name
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

   
   
    // Optional: Handle form submission via JavaScript
    document.getElementById('productForm').addEventListener('submit', function(event) {
        // Prevent default form submission
        event.preventDefault();

        // Optionally, you can perform validation or additional actions here

        // Submit the form via AJAX or default form submission
        this.submit();
    });
    // Function to handle adding product to cart
function addToCart(productId) {
    // Perform any necessary AJAX or logic here

    // Update shopping cart count
    updateCartCount();

    // Show success message
    showSuccessMessage('Added to cart successfully.');
}

// Function to update shopping cart count
function updateCartCount() {
    var cartCountElement = document.getElementById('cartItemCount');
    var currentCount = parseInt(cartCountElement.textContent.trim());
    cartCountElement.textContent = currentCount + 1;
}

// Function to show success message with sliding animation
function showSuccessMessage(message) {
    var successPopup = document.createElement('div');
    successPopup.className = 'success-popup';
    successPopup.textContent = message;

    // Create horizontal loader
    var loader = document.createElement('span');
    loader.className = 'horizontal-loader';
    successPopup.appendChild(loader);

    // Append success popup to the body
    document.body.appendChild(successPopup);

    // Animate sliding in from the right
    setTimeout(function() {
        successPopup.style.right = '20px'; // Slide into view
    }, 100); // Small delay for smoother animation start

    // Hide after 3 seconds
    setTimeout(function() {
        // Animate sliding out to the right
        successPopup.style.right = '-300px'; // Slide out of view
        setTimeout(function() {
            // Remove the success popup from DOM after animation completes
            document.body.removeChild(successPopup);
        }, 500); // Wait for animation to finish (0.5s)
    }, 3000); // 3 seconds
}
