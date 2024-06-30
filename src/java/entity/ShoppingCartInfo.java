/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import entity.Payments;
import entity.Customers;
import entity.Books;

/**
 *
 * @author vuhoa
 */
public class ShoppingCartInfo {

    private Payments payments;
    private Books books;
    private Customers customers;
    private int total_quantity;

    public ShoppingCartInfo() {
    }

    public ShoppingCartInfo(Payments payments, Books books, Customers customers, int total_quantity) {
        this.payments = payments;
        this.books = books;
        this.customers = customers;
        this.total_quantity = total_quantity;
    }

    public Payments getPayments() {
        return payments;
    }

    public Books getBooks() {
        return books;
    }

    public Customers getCustomers() {
        return customers;
    }

    public int getTotal_quantity() {
        return total_quantity;
    }

    public void setPayments(Payments payments) {
        this.payments = payments;
    }

    public void setBooks(Books books) {
        this.books = books;
    }

    public void setCustomers(Customers customers) {
        this.customers = customers;
    }

    public void setTotal_quantity(int total_quantity) {
        this.total_quantity = total_quantity;
    }

    @Override
    public String toString() {
        return "ShoppingCartInfo{" + "payments=" + payments + ", books=" + books + ", customers=" + customers + ", total_quantity=" + total_quantity + '}';
    }

}
