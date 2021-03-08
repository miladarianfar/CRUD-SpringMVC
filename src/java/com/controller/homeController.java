package com.controller;

import com.dao.CustomerDAO;
import com.entity.Customer;
import com.service.CustomerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/home")
public class homeController {

    @Autowired(required = false)
    private CustomerService customerService;

    
    @RequestMapping("/list")
    public String showHome() {
        return "index";
    }

    @RequestMapping("/welcome")
    public String customerList(Model model) {
        List<Customer> customers = customerService.getCustomers();

        model.addAttribute("customers", customers);

        return "list-customer";
    }
    
    @RequestMapping("/showFormForAdd")
    public String showFormForAdd(Model model){
        
        Customer theCustomer = new Customer();
        
        model.addAttribute("customer", theCustomer);
        
        return "add-customer-form";
    }

    @PostMapping("/saveCustomer")
    public String saveCustomer(@ModelAttribute("customer") Customer theCustomer){
        
        customerService.saveCustomer(theCustomer);
        
        return "redirect:/home/welcome";
    }
    
    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("customerId") int theId , Model model){
        
        Customer theCustomer = customerService.getCustomer(theId);
        
        model.addAttribute("customer", theCustomer);
        
        return "add-customer-form";
    }
    
    @GetMapping("/delete")
    public String delete(@RequestParam("customerId") int theId){
        
        customerService.delete(theId);
        
        return "redirect:/home/welcome";
    }
    
}
