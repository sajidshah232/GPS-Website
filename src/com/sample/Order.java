package com.sample;

public class Order {    
    private Customer customer;
    private Product product;
    private int qty;
    private String orderdate;

    public String getOrderdate() {
        return orderdate;
    }           

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
    
    
}
