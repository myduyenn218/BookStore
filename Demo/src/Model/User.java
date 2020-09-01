package Model;

import java.sql.*;

import db.ConnectionDB;

import java.sql.SQLException;
import java.util.ArrayList;

public class User {
    private int id;
    private String id_fb;
    private String email;
    private String userName;
    private String fullName;
    private String gender;
    private String address;
    private String phone;
    private String password;
    private String dateofbirth;
    private String avt;
    private int idgroup; // 1 is user, 2 is admin
    private int active; //0 is not active, 1 is active
    private Cart cart;
    private WishList wishlist;


    public User() {
        cart = new Cart();
        wishlist = new WishList();
        id = 0;
        email = "";
        userName = "";
        gender = "";
        address = "";
        phone = "";
        avt = "";
        idgroup = 1;

    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDateofbirth() {

        return dateofbirth;
    }

    public void setDateofbirth(String dateofbirth) {
        if (dateofbirth == null) return;
        this.dateofbirth = dateofbirth;
    }

    public WishList getWishlist() {
        return wishlist;
    }

    public void setWishlist(WishList wishlist) {
        this.wishlist = wishlist;
    }

    public int getTotalPrice() {
        return (int) this.cart.getTotalPrice();
    }


    public String getGender() {
        return gender;
    }

    public String getId_fb() {
        return id_fb;
    }

    public void setId_fb(String id_fb) {
        if (id_fb == null) return;
        this.id_fb = id_fb;
    }

    public void setGender(String gender) {
        if (gender == null) return;
        this.gender = gender;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        if (fullName == null) return;
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        if (address == null) return;
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        if (phone == null) return;
        this.phone = phone;
    }

    public String getAvt() {
        return avt;
    }

    public void setAvt(String avt) {
        this.avt = avt;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        if (email == null) return;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        if (userName == null) return;
        this.userName = userName;
    }

    public int getIdgroup() {
        return idgroup;
    }

    public void setIdgroup(int idgroup) {
        this.idgroup = idgroup;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }


    public void addToShoppingCard(Product product) {
        this.cart.put(product);
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", userName='" + userName + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", avt='" + avt + '\'' +
                ", idgroup=" + idgroup +
                ", active=" + active +
                '}';
    }

}
