package com.nt.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itextpdf.text.DocumentException;
import com.nt.Entity.Addcart;
import com.nt.Entity.Login;
import com.nt.service.InvoicePdfService;
import com.nt.service.LoginService;
import com.nt.service.AddcartService;

@Controller
public class InvoiceController {

    @Autowired
    private InvoicePdfService invoicePdfService;

    @Autowired
    private AddcartService addcartService;
    @Autowired
    private LoginService loginService;
    // This endpoint generates the invoice PDF and sends it to the client
    @GetMapping("/generateInvoice/{id}")
    public void generateInvoice(
            @RequestParam("id") Long id,Addcart carts,
            HttpServletResponse response) throws IOException, DocumentException {

        // You need to fetch the Login entity from your service or repository
        Login login = getLoginById(id); // Implement this method
        List<Login> listLogin=loginService.loginData(login);
        String userName=listLogin.get(0).getName();
        String contact=listLogin.get(0).getMobile();
        String userAddress=listLogin.get(0).getAddress();

        // Fetch all Addcart items
        List<Addcart> products = addcartService.cartList(carts);
      String paymentType=  products.get(0).getPaymenttype();
      long totalProduct=products.get(0).getTotalproduct();
      double totalPrice=products.get(0).getPrice();
      double totalAmount = totalProduct * totalPrice;
      double discount = 0.10; // 10% discount
      double discountedAmount = totalAmount - (totalAmount * discount);


        // Generate the PDF
        byte[] pdfContent = invoicePdfService.generateInvoicePdf(login, products,paymentType,userName,contact,userAddress);

        // Set the content type and attachment header for the response
        response.setContentType("application/pdf");
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=invoice.pdf");
        response.setContentLength(pdfContent.length);

        // Write the PDF content to the response output stream
        response.getOutputStream().write(pdfContent);
        response.getOutputStream().flush();
    }

    // Example method to fetch Login entity from your service or repository
    private Login getLoginById(Long id) {
        // Fetch Login entity by id from your service or repository
        return new Login(); // Replace with actual implementation
    }
}
