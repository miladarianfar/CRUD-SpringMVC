package com.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.entity.Customer;

@Service
public interface CustomerService {

    public List<Customer> getCustomers();

    public void saveCustomer(Customer customer);

    public Customer getCustomer(int theId);

    public void delete(int theId);

}
