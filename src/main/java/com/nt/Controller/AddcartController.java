package com.nt.Controller;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.Entity.Addcart;
import com.nt.service.AddcartService;

@Controller
@Transactional
public class AddcartController {
    
    @Autowired
    private AddcartService addcartservice;
    
    @GetMapping("/showcart")
    public String cartShow(Model model, Addcart addcarts) {
        model.addAttribute("cartData", addcartservice.cartList(addcarts));
        model.addAttribute("cartcount", addcartservice.countData());
        return "product/cart/carts";
    }
    
    @PostMapping("/addcartdata/{productid}")
    public String addCartdata(Addcart addcarts, @PathVariable Long productid, RedirectAttributes redirectAttributes) {
        boolean isAdded = addcartservice.existProductid(productid);
        if (!isAdded) {
            addcartservice.addCart(addcarts);
            redirectAttributes.addFlashAttribute("cartData", addcartservice.cartList(addcarts));
            redirectAttributes.addFlashAttribute("success", "Cart added successfully.");
            return "redirect:/productlists";
        } else {
            redirectAttributes.addFlashAttribute("error", "Cart already present!");
            return "redirect:/productlists";
        }
    }
    
    @PostMapping("/deleteCart/{productid}")
    public String deleteCartId(@PathVariable Long productid, Model model, Addcart addcarts) {
        addcartservice.deleteCartId(productid);
        return "redirect:/showcart";
    }
    
    @PostMapping("/deleteAlldata")
    public String deleteAllList(Model model) {
        boolean isDeleted = addcartservice.deleteAll();
        if (isDeleted) {
            model.addAttribute("fnks", "sjj");
        } else {
            model.addAttribute("eror", "aas");
        }
        return "redirect:/showcart";
    }
}
