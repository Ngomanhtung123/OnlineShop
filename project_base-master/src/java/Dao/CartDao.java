/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Cart;
import Model.CategoryBlog;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vieta
 */
public class CartDao extends DBcontext {

    public boolean deleteCart(int uid, int productID) {
        try {
            String sql = "delete from cart where User_id = "+uid+" and Product_id = "+productID+"";
            Statement stm = connection.createStatement();
            stm.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
        }
        return false;
    }

    public List<Cart> getALlCartByUserID(int id) {
        ProductDao d = new ProductDao();
        List<Cart> list = new ArrayList<>();
        try {
            String sql = "select * from cart where user_id = " + id + ";";
            Statement stm = connection.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setUser_id(rs.getInt(1));
                cart.setProduct(d.getProductByID(rs.getInt(2)));
                cart.setQuantity(rs.getInt(3));
                list.add(cart);
            }
        } catch (SQLException ex) {
        }
        return list;
    }
    public void Addtocart(int user_id, int product_ID, int quantity){
        try {
                 String sql = "insert into cart values"
                        + "(" + user_id + ", " + product_ID + ", " + quantity + ");";
                System.out.println(sql);
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.executeUpdate();
            } catch (Exception e) {
            }
    }
    
    public void Addtocart(int user_id, int product_ID) {
        boolean check = false;
        int quantity = 0;
        List<Cart> l = getALlCartByUserID(user_id);
        for (Cart c : l) {
            if (c.getProduct().getProduct_id() == product_ID) {
                quantity = c.getQuantity();
                check = true;
            }
        }
        if (check == false) {
            try {
                String sql = "insert into cart values"
                        + "(" + user_id + ", " + product_ID + ", " + 1 + ");";
                System.out.println(sql);
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.executeUpdate();
            } catch (Exception e) {
            }
        } else {
            try {
                String sql = "update cart set quantity = " + (quantity + 1) + " where product_id = " + product_ID + " and user_id = " + user_id + ";";
                System.out.println(sql);
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.executeUpdate();
            } catch (Exception e) {
            }
        }
    }

    public double getTotals(List<Cart> lc) {
        double totals = 0;
        for (Cart c : lc) {
            totals = totals + c.getQuantity() * c.getProduct().getSale_prices();
        }
        return totals;
    }

    public void UpdateCart(boolean check, String uproduct, String productdelete, int user_id) {
        if (productdelete != null) {
            try {
                String sql = "delete from cart where user_id = " + user_id + " and  product_id = " + productdelete + ";";
                System.out.println(sql);
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.executeUpdate();
            } catch (SQLException e) {

            }
        }
        if (uproduct != null) {
            try {
                int quantity = 0;
                String sql1 = "select quantity from cart where product_id = " + uproduct + " and user_id = " + user_id + ";";
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(sql1);
                while (rs.next()) {
                    quantity = rs.getInt(1);
                }
                if (check == true) {
                    quantity = quantity + 1;

                    String sql = " update cart set quantity = " + quantity + " where product_id = " + uproduct + " and user_id = " + user_id + ";";
                    System.out.println(sql);
                    PreparedStatement stm = connection.prepareStatement(sql);
                    stm.executeUpdate();
                } else {
                    quantity = quantity - 1;
                    if (quantity < 0) {
                        quantity = quantity + 1;
                    }
                    String sql = " update cart set quantity = " + quantity + " where product_id = " + uproduct + " and user_id = " + user_id + ";";
                    System.out.println(sql);
                    PreparedStatement stm = connection.prepareStatement(sql);
                    stm.executeUpdate();
                }
            } catch (SQLException e) {

            }
        }
    }

    public static void main(String[] args) {
        CartDao d = new CartDao();

    }

}
