package Model;

import java.awt.*;
import java.util.ArrayList;

public class WishList {
    private int id;
    private ArrayList<Product> wishlist;

    public WishList() {
        wishlist = new ArrayList<Product>();
    }

    public ArrayList<Product> getWishlist() {
        return wishlist;
    }

    public void setWishlist(ArrayList<Product> wishlist) {
        this.wishlist = wishlist;
    }

    public void add(Product p) {
        this.wishlist.add(p);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void remove(int bookID) {
        for (Product item : wishlist) {
            if (item.getId() == bookID) wishlist.remove(item);
            return;
        }
    }
}