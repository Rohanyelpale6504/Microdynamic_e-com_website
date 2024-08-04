package com.nt.service;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.nt.Entity.Addcart;
import com.nt.Entity.Login;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class InvoicePdfService {

    public byte[] generateInvoicePdf(Login login, List<Addcart> products, String paymentType, String userName, String contact, String userAddress) throws IOException, DocumentException {
        Document document = new Document(PageSize.A4, 10, 10, 10, 10); // Adjust margins
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {
            PdfWriter writer = PdfWriter.getInstance(document, out);
            document.open();

            // Add invoice title
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
            Paragraph title = new Paragraph("Order Details", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            
            document.add(title);

            // Add space after title
           

            // Add top section with logo and date
            PdfPTable topTable = new PdfPTable(2);
            topTable.setWidthPercentage(100);
            topTable.setWidths(new int[]{4, 6});
            PdfPCell cell;

            // Add logo
            Image logo = Image.getInstance("src/main/resources/static/logo/logo.png"); // Update path to logo
            logo.scaleToFit(150, 150);
            cell = new PdfPCell(logo);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            document.add(Chunk.NEWLINE);
            cell.setBorder(Rectangle.BOX);
            cell.setRowspan(4);
            topTable.addCell(cell);

            // Empty cell for spacing
//            cell = new PdfPCell();
//            cell.setBorder(Rectangle.BOX);
//            topTable.addCell(cell);

            // Company information
            PdfPTable companyInfoTable = new PdfPTable(1);
            companyInfoTable.addCell(createCell("Microdynamic Software Pty Ltd", PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10), Rectangle.NO_BORDER));
            companyInfoTable.addCell(createCell(" NOBLE MANCHESTER, 9G, NAVALE IT ZONE, NARHE Pune, Maharashtra, 411041 India", PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.NO_BORDER));
            companyInfoTable.addCell(createCell("Contact Name:  Laksman Yalmar", PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.NO_BORDER));
            companyInfoTable.addCell(createCell("Phone: 08043853706", PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.NO_BORDER));
            companyInfoTable.addCell(createCell("Email: contact@microdynamicsoftware.com", PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.NO_BORDER));
            companyInfoTable.addCell(createCell("Date: " + new SimpleDateFormat("yyyy-MM-dd").format(new Date()), PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.NO_BORDER));

            cell = new PdfPCell();
            cell.addElement(companyInfoTable);
            cell.setBorder(Rectangle.BOX);
            topTable.addCell(cell);

            document.add(topTable);

          

            // Add Bill To section and other details
            PdfPTable mainTable = new PdfPTable(2);
            mainTable.setWidthPercentage(100);
            mainTable.setWidths(new int[]{3,2});

            // Left column with Bill To details
            PdfPTable billToTable = new PdfPTable(1);
            billToTable.addCell(createCell("Bill To", PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12), Rectangle.NO_BORDER));
            billToTable.addCell(createCell(userName, PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.NO_BORDER));
            billToTable.addCell(createCell(userAddress, PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.NO_BORDER));
            billToTable.addCell(createCell("Phone: " + contact, PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.NO_BORDER));

            PdfPCell leftCell = new PdfPCell();
            leftCell.addElement(billToTable);
            leftCell.setBorder(Rectangle.BOX);
            mainTable.addCell(leftCell);

            // Right column with Invoice details
            PdfPTable rightTable = new PdfPTable(1);
            rightTable.addCell(createCell("Invoice No:", PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10), Rectangle.NO_BORDER));
            rightTable.addCell(createCell(generateInvoiceNumber(), PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.NO_BORDER));
            rightTable.addCell(createCell("Date:", PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10), Rectangle.NO_BORDER));
            rightTable.addCell(createCell(new SimpleDateFormat("yyyy-MM-dd").format(new Date()), PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.NO_BORDER));
            rightTable.addCell(createCell("Payment Method:", PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10), Rectangle.NO_BORDER));
            rightTable.addCell(createCell(paymentType, PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.NO_BORDER));

            PdfPCell rightCell = new PdfPCell();
            rightCell.addElement(rightTable);
            rightCell.setBorder(Rectangle.BOX);
            mainTable.addCell(rightCell);

            document.add(mainTable);

            // Add space after main content
            

            // Add product details table
            PdfPTable productTable = new PdfPTable(4);
            productTable.setWidthPercentage(100);
            productTable.setWidths(new int[]{4, 2, 2, 2});
            productTable.setSpacingBefore(0f);
            productTable.setSpacingAfter(10f);

            // Header row with background color
            Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10);
            PdfPCell headerCell;
            headerCell = new PdfPCell(new Phrase("Product Name", headerFont));
            productTable.addCell(headerCell);

            headerCell = new PdfPCell(new Phrase("Quantity", headerFont));
            productTable.addCell(headerCell);

            headerCell = new PdfPCell(new Phrase("Price", headerFont));
            productTable.addCell(headerCell);

            headerCell = new PdfPCell(new Phrase("Subtotal", headerFont));
            productTable.addCell(headerCell);

            double totalPrice = 0.0;
            double discountRate = 0.10; // 10% discount

            // Add product rows
            for (Addcart product : products) {
                double subtotal = product.getTotalproduct() * product.getPrice();
                productTable.addCell(createCell(product.getName(), PdfPCell.ALIGN_LEFT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.BOX));
                productTable.addCell(createCell(String.valueOf(product.getTotalproduct()), PdfPCell.ALIGN_CENTER, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.BOX));
                productTable.addCell(createCell(String.format("$%.2f", product.getPrice()), PdfPCell.ALIGN_RIGHT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.BOX));
                productTable.addCell(createCell(String.format("$%.2f", subtotal), PdfPCell.ALIGN_RIGHT, FontFactory.getFont(FontFactory.HELVETICA, 10), Rectangle.BOX));
                totalPrice += subtotal;
            }

            // Add total of subtotals
            PdfPCell totalHeaderCell = new PdfPCell(new Phrase("Total of Subtotals", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10)));
            totalHeaderCell.setColspan(3);
            totalHeaderCell.setRowspan(1);
            totalHeaderCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            totalHeaderCell.setBorder(Rectangle.BOX);
            productTable.addCell(totalHeaderCell);

            PdfPCell totalValueCell = new PdfPCell(new Phrase(PdfPCell.ALIGN_RIGHT, String.format("$%.2f", totalPrice), FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10)));
            totalValueCell.setBorder(Rectangle.BOX);
            productTable.addCell(totalValueCell);

            // Calculate and add discount
            double discount = totalPrice * discountRate;
            double finalTotal = totalPrice - discount;

            // Add discount row
            PdfPCell discountHeaderCell = new PdfPCell(new Phrase("Discount (" + (int) (discountRate * 100) + "%)", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10)));
            discountHeaderCell.setColspan(3);
            discountHeaderCell.setRowspan(1);
            discountHeaderCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            discountHeaderCell.setBorder(Rectangle.BOX);
            productTable.addCell(discountHeaderCell);

            PdfPCell discountValueCell = new PdfPCell(new Phrase( PdfPCell.ALIGN_RIGHT,String.format("-$%.2f", discount), FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10)));
            discountValueCell.setBorder(Rectangle.BOX);
            productTable.addCell(discountValueCell);

            // Add final total row
            PdfPCell finalTotalHeaderCell = new PdfPCell(new Phrase("Final Total", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10)));
            finalTotalHeaderCell.setColspan(3);
            finalTotalHeaderCell.setRowspan(1);
            finalTotalHeaderCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            finalTotalHeaderCell.setBorder(Rectangle.BOX);
            productTable.addCell(finalTotalHeaderCell);

            PdfPCell finalTotalValueCell = new PdfPCell(new Phrase( PdfPCell.ALIGN_RIGHT,String.format("$%.2f", finalTotal), FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10)));
            finalTotalValueCell.setBorder(Rectangle.BOX);
            productTable.addCell(finalTotalValueCell);

            document.add(productTable);

           

            // Add footer
            PdfPTable footerTable = new PdfPTable(1);
            footerTable.setWidthPercentage(100);
            footerTable.setSpacingBefore(0f);

            // Terms and Conditions
            Paragraph terms = new Paragraph();
            terms.setFont(FontFactory.getFont(FontFactory.HELVETICA, 10));
            terms.add(new Phrase("Terms and Conditions:", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10)));
            terms.add(Chunk.NEWLINE);
            terms.add(new Phrase("1. Shipping charges are calculated at checkout and displayed before payment confirmation.", FontFactory.getFont(FontFactory.HELVETICA, 10)));
            terms.add(Chunk.NEWLINE);
            terms.add(new Phrase("2. Orders are delivered within 20 to 30 working days, excluding public holidays.", FontFactory.getFont(FontFactory.HELVETICA, 10)));
            terms.add(Chunk.NEWLINE);
            terms.add(new Phrase("3. Slight variations in handcrafted wooden products are not considered defects and are not eligible for return.", FontFactory.getFont(FontFactory.HELVETICA, 10)));
            terms.add(Chunk.NEWLINE);
            terms.add(new Phrase("4. Customized orders cannot be returned, and refunds will be processed within 48 hours of claim acceptance.", FontFactory.getFont(FontFactory.HELVETICA, 10)));
            terms.add(Chunk.NEWLINE);
            terms.add(new Phrase("5. Cancellation requests are accepted within 3 hours of booking if the order has not been dispatched.", FontFactory.getFont(FontFactory.HELVETICA, 10)));

            PdfPCell footerCell = new PdfPCell();
            footerCell.addElement(terms);
            footerCell.setBorder(Rectangle.BOX);
            footerTable.addCell(footerCell);

            document.add(footerTable);

            // Add border around the entire page
            PdfContentByte canvas = writer.getDirectContent();
            Rectangle pageSize = document.getPageSize();
            canvas.setLineWidth(1f);
            canvas.rectangle(pageSize.getLeft(10), pageSize.getBottom(10), pageSize.getWidth() - 20, pageSize.getHeight() - 20);
            canvas.stroke();

        } finally {
            document.close();
        }

        return out.toByteArray();
    }

    private PdfPCell createCell(String content, int align, Font font, int border) {
        PdfPCell cell = new PdfPCell(new Phrase(content, font));
        cell.setHorizontalAlignment(align);
        cell.setBorder(border);
        return cell;
    }

    private String generateInvoiceNumber() {
        Random random = new Random();
        int number = random.nextInt(9000) + 1000; // Generates a random 4-digit number
        return "INV-" + number;
    }
}
