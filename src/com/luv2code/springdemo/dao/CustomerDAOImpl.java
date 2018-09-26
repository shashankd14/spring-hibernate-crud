package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	//inject Hibernate sessionFactory
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<Customer> getCustomers() {
		
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//create query to get list of customers
		Query<Customer> theQuery = 
				currentSession.createQuery("from Customer order by lastName", 
											Customer.class);
		
		//execute query to get result set
		List<Customer> customers = theQuery.getResultList();
		
		//return the results
		return customers;
	}


	@Override
	public void saveCustomer(Customer theCustomer) {

		//get current hibernate session
		Session currenSession = sessionFactory.getCurrentSession();
		
		//save object
		currenSession.saveOrUpdate(theCustomer);
	}


	@Override
	public Customer getCustomer(int theId) {
		
		//get current hibernate session
		Session currenSession = sessionFactory.getCurrentSession();
		
		//retrieve/return from db the customer using the primary key
		Customer theCustomer = currenSession.get(Customer.class, theId);
		
		//return the customer object
		return theCustomer;
	}


	@Override
	public void deleteCustomer(int theId) {
		
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//create query
		Query theQuery = currentSession.createQuery("delete from Customer where id =:customerId");
		theQuery.setParameter("customerId", theId);
		
		//execute query
		theQuery.executeUpdate();
	}

}
