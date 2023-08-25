/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Feedback;
import Model.Slider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vieta
 */
public class FeedbackDao extends DBcontext {

    public boolean sendfeedback(String feedback, String rate, int uid, String pid, String img, int orderID) {
        try {
            String sql = "INSERT INTO feedback (feedback_img,feedback, rate_star, product_id, User_id, feedback_status, create_date, OrderID)"
                    + " VALUES ('" + img + "', '" + feedback + "', '" + rate + "', '" + pid + "', '" + uid + "', 1, CURDATE(), "+orderID+");";
            System.out.println(sql);
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean changeStatusfb(String fid, String status) {
        try {
            String sql = "UPDATE `feedback` SET `feedback_status` = b'" + status + "' WHERE (`feedback_id` = '" + fid + "');";
            System.out.println(sql);
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        try {
            String sql = "select * from feedback";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback sl = new Feedback(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getFloat(4), rs.getInt(5), rs.getInt(6), rs.getBoolean(7), rs.getString(8));
                sl.setProduct(new ProductDao().getProductByID(sl.getProduct_id()));
                sl.setUser(new UserDao().getUserById(sl.getUser_id()));
                list.add(sl);
            }
        } catch (SQLException ex) {

        }
        return list;
    }

    public List<Feedback> getAllFeedbackByCondtion(String status, String rate, String search, int index, int pagesize) {
        List<Feedback> list = new ArrayList<>();
        try {
            String sql = "select * from feedback \n"
                    + "where ";
                    if(!status.isEmpty()){
                     sql += " feedback_status =" + status + " and ";
                    }
                    sql += "  rate_star like '%" + rate + "%' and feedback like '%" + search + "%'\n"
                    + "order by feedback_id asc\n"
                    + "limit " + pagesize + " offset " + (index - 1) * pagesize;
            System.out.println(sql);
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback sl = new Feedback(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getFloat(4), rs.getInt(5), rs.getInt(6), rs.getBoolean(7), rs.getString(8));
                sl.setProduct(new ProductDao().getProductByID(sl.getProduct_id()));
                sl.setUser(new UserDao().getUserById(sl.getUser_id()));
                list.add(sl);
            }
            stm.close();
        } catch (SQLException ex) {

        }
        return list;
    }

    public Feedback getFeedbackById(String id) {
        try {
            String sql = "select * from feedback where feedback_id = " + id + ";";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback sl = new Feedback(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getFloat(4), rs.getInt(5), rs.getInt(6), rs.getBoolean(7), rs.getString(8));
                sl.setProduct(new ProductDao().getProductByID(sl.getProduct_id()));
                sl.setUser(new UserDao().getUserById(sl.getUser_id()));
                return sl;
            }   
            stm.close();

        } catch (SQLException ex) {

        }
        return null;
    }
    
    public boolean checktFeedbackExist(int productID, int user_ID, int orderID){
        try {
            String Sql = "select * from feedback where User_id = "+user_ID+" and product_id = "+productID+" and OrderID = "+orderID+";";
            PreparedStatement stm = connection.prepareStatement(Sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }   
        } catch (Exception e) {
            return false;
        }
        return false;
    }
}
