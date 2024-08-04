<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .invoice-table {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .invoice-header, .invoice-footer, .invoice-info, .terms-conditions {
            background-color: #f8f9fa;
            padding: 10px;
            border-bottom: 1px solid #dee2e6;
        }
        .invoice-footer {
            border-top: 1px solid #dee2e6;
        }
        .btn-pdf {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .invoice-header h2, .invoice-header p, .invoice-info p, .terms-conditions p {
            margin: 0;
        }
        .terms-conditions {
            font-size: 0.9rem;
        }
        .invoice-title {
            text-transform: uppercase;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="card invoice-table">
        <div class="card-header invoice-header">
            <h2 class="invoice-title">Order Details</h2>
            <h3 class="invoice-title">DECORSAGA DESIGN FURNISHING</h3>
            <p>Decorsaga Design Furnishing LLP</p>
            <p>Shop No 5, 8A Pachima Nagari, Near City Pride Kothrud, Pune 411038</p>
            <p>Phone: 8369189554 | GST: 27AAUFD6504GIZ8</p>
            <p>Email: support@decorsagadesign.com | Website: www.decorsagdesign.com</p>
        </div>

        <div class="card-body">
            <div class="row invoice-info">
                <div class="col-md-6">
                    <p><strong>Bill To:</strong></p>
                    <p>Upendra</p>
                    <p>C-103i Rohan Kritika, Sinhagad Road, Rasta Peth (411030)</p>
                    <p>Phone: 8411884445</p>
                </div>
                <div class="col-md-6 text-md-right">
                    <p><strong>Invoice No:</strong> 59</p>
                    <p><strong>Date:</strong> 14-06-2024</p>
                    <p><strong>Payment Method:</strong> Online Payment</p>
                </div>
            </div>
            
            <table class="table table-bordered mt-3">
                <thead class="thead-light">
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>MRP</th>
                        <th>Disc.</th>
                        <th>IGST</th>
                        <th>CGST</th>
                        <th>SGST</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Modern Nest Club Seater<br>SKU ID. DSDAC008 CST (Included)</td>
                        <td>1</td>
                        <td>16749.00</td>
                        <td>3750.00</td>
                        <td>0.00</td>
                        <td>779.94</td>
                        <td>779.94</td>
                        <td>12999.00</td>
                    </tr>
                    <!-- Additional rows can be added here -->
                </tbody>
            </table>

            <table class="table table-bordered mt-3">
                <tbody>
                    <tr>
                        <th>Taxable Amount</th>
                        <td>12990.00</td>
                        <th>IGST</th>
                        <td>0.00</td>
                        <th>CGST</th>
                        <td>779.94</td>
                        <th>SGST</th>
                        <td>779.94</td>
                    </tr>
                    <tr>
                        <th>Tax Amount:</th>
                        <td colspan="7">1559.88</td>
                    </tr>
                    <tr>
                        <th>Amount in Words:</th>
                        <td colspan="7">Indian Rupee Twelve Thousand, Two Hundred Eighty-three Only</td>
                    </tr>
                    <tr>
                        <th>Cart Value</th>
                        <td colspan="7">12999.00</td>
                    </tr>
                    <tr>
                        <th>Shipping</th>
                        <td colspan="7">649.00</td>
                    </tr>
                    <tr>
                        <th>SubTotal</th>
                        <td colspan="7">13648.00</td>
                    </tr>
                    <tr>
                        <th>Coupon</th>
                        <td colspan="7">1365.00</td>
                    </tr>
                    <tr>
                        <th>Net Amount</th>
                        <td colspan="7">12283.00</td>
                    </tr>
                    <tr>
                        <th>Paid Amount</th>
                        <td colspan="7">12283.00</td>
                    </tr>
                    <tr>
                        <th>Balance</th>
                        <td colspan="7">0.00</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="card-footer invoice-footer">
            <p><strong>Terms and Conditions:</strong></p>
            <p class="terms-conditions">
                1. Shipping charges are calculated at checkout and displayed before payment confirmation.<br>
                2. Orders are delivered within 20 to 30 working days, excluding public holidays.<br>
                3. Slight variations in handcrafted wooden products are not considered defects and are not eligible for return.<br>
                4. Customized orders cannot be returned, and refunds will be processed within 48 hours of claim acceptance.<br>
                5. Cancellation requests are accepted within 3 hours of booking if the order has not been dispatched.
            </p>
        </div>
    </div>

    <div class="btn-pdf">
        <button class="btn btn-primary" onclick="generatePDF()">Generate PDF</button>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>
<script>
    async function generatePDF() {
        const { jsPDF } = window.jspdf;

        const doc = new jsPDF();
        const companyInfo = [
            'DECORSAGA DESIGN FURNISHING',
            'Decorsaga Design Furnishing LLP',
            'Shop No 5, 8A Pachima Nagari, Near City Pride Kothrud, Pune 411038',
            'Phone: 8369189554 | GST: 27AAUFD6504GIZ8',
            'Email: support@decorsagadesign.com | Website: www.decorsagdesign.com'
        ].join('\n');

        const billToInfo = [
            'Bill To:',
            'Upendra',
            'C-103i Rohan Kritika, Sinhagad Road, Rasta Peth (411030)',
            'Phone: 8411884445'
        ].join('\n');

        const invoiceDetails = [
            'Invoice No: 59',
            'Date: 14-06-2024',
            'Payment Method: Online Payment'
        ].join('\n');

        const termsConditions = [
            'Terms and Conditions:',
            '1. Shipping charges are calculated at checkout and displayed before payment confirmation.',
            '2. Orders are delivered within 20 to 30 working days, excluding public holidays.',
            '3. Slight variations in handcrafted wooden products  are not eligible for return.',
            '4. Customized orders cannot be returned, processed within 48 hours of claim acceptance.',
            '5. Cancellation requests are accepted within 3 hours of booking if the order has not been dispatched.'
        ].join('\n');

        const tableData = [...document.querySelectorAll('.table tbody tr')].map(row => 
            [...row.cells].map(cell => cell.innerText)
        );

        // Add company info
        doc.setFontSize(18);
        doc.text('Order Details', 20, 10);
        doc.setFontSize(12);
        doc.text(companyInfo, 20, 20);

        // Add Bill To and Invoice details
        doc.setFontSize(12);
        doc.text(billToInfo, 20, 50);
        doc.text(invoiceDetails, 140, 50);

        // Add table
        doc.autoTable({
            startY: 70,
            head: [['Product Name', 'Quantity', 'MRP', 'Disc.', 'IGST', 'CGST', 'SGST', 'Amount']],
            body: tableData,
        });

        // Add terms and conditions
        doc.text(termsConditions, 20, doc.lastAutoTable.finalY + 10);

        // Save the PDF
        doc.save('invoice.pdf');
    }
</script>
</body>
</html>
