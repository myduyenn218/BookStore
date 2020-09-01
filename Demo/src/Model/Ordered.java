package Model;

import java.sql.Date;
import java.util.ArrayList;

public class Ordered {
    private int id;
    private Date date;
    private ArrayList<String> products;
    private int totalPrice;
    private String status;

    public Ordered(int id, Date date, ArrayList<String> products, int totalPrice, String status) {
        this.id = id;
        this.date = date;
        this.products = products;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getProducts() {
        String rs = "";
        for (String name : products) {
            rs += name + "<br>";
        }
        return rs.trim();
    }

    public void setProducts(ArrayList<String> products) {
        this.products = products;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}



