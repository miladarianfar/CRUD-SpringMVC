package com.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.Customer;

@Repository("customerDAO")
public class CustomerDAOImpl implements CustomerDAO {

    @Autowired(required = false)
    private SessionFactory sessionFactory;
    

    @Override
    public List<Customer> getCustomers() {

        Session session = sessionFactory.getCurrentSession();

        Query<Customer> theQuery = session.createQuery("from Customer", Customer.class);

        List<Customer> customers = theQuery.getResultList();

        return customers;
    }

    @Override
    public void saveCustomer(Customer customer) {

        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(customer);
    }

    @Override
    public Customer getCustomer(int theId) {
        
        Session session = sessionFactory.getCurrentSession();
        
        Customer theCustomer = session.get(Customer.class , theId);
        
        return theCustomer;
    }

    @Override
    public void delete(int theId) {
        
        Session session = sessionFactory.getCurrentSession();
        
        Customer theCustomer = session.get(Customer.class , theId);
        
        session.delete(theCustomer);
    }
    
}
