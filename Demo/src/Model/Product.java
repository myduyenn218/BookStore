package Model;

import db.ConnectionDB;

import java.sql.*;

public class Product {
    private int id;
    private String title;
    private int rating;
    private String type;
    private String publisher;
    private String author;
    private String description;
    private String img;
    private int price;
    private int quantity;


    public Product() {
    }

    public Product(int id, String img, String title, int rating, String type, String publisher, String author, String description, int price, int quantity) {
        this.id = id;
        this.img = img;
        this.title = title;
        this.rating = rating;
        this.type = type;
        this.publisher = publisher;
        this.author = author;
        this.description = description;
        this.price = price;
        this.quantity = quantity;

    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getTotalPrice() {
        return (int) (price) * quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void quantityUp() {
        this.quantity++;
    }

    public void quantityUp(int quantity) {
        setQuantity(this.quantity + quantity);
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }



    @Override
    public String toString() {
        return "Wish{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", rating=" + rating +
                ", type='" + type + '\'' +
                ", author='" + author + '\'' +
                ", description='" + description + '\'' +
                ", img='" + img + '\'' +
                ", price=" + price +
                '}';
    }
}
