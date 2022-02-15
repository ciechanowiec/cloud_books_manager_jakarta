package com.logic;

public class Book {

    private int id;
    private String title;
    private String author;
    private double price;
    
    public Book(String title, String author, double price) {        
        this.title = title;
        this.author = author;
        this.price = price;
    }

    public Book(int id, String title, String author, double price) {
        this(title, author, price);
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return this.author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        /* Round in order to avoid more than two digits after the dot */
        return Math.round(this.price * 100.0) / 100.0;        
    }

    public void setPrice(double price) {
        this.price = price;
    }

    /* Method for testing purposes.*/
    public String toString() {        
        return String.format("id: %d | title: %s | author: %s | price: %.2f",
                             this.id, this.title, this.author, this.price);
    }    
    
}
