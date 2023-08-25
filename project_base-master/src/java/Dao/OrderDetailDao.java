/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.sql.SQLException;
import Model.OrderDetail;
import java.util.ArrayList;

/**
 *
 * @author vieta
 */
public class OrderDetailDao extends DBcontext {

    public void CreateOrderDetail(int user_id, Float Price, int quantity, int order_id, int productid) {

        try {
            String sql = "INSERT INTO order_detail VALUES (NULL,'" + Price + "', '" + quantity + "', '" + order_id + "', '" + productid + "', " + " CURRENT_DATE(), 0);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public List<OrderDetail> getOderDetailsByOrderID(String id) {
       
        ProductDao pd = new ProductDao();
        List<OrderDetail> list = new ArrayList<OrderDetail>();
        try {
            String sql = "select * from order_detail where order_id = " + id + "; ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setOrder_detailID(rs.getInt(1));
                od.setPrices(rs.getFloat(2));
                od.setQuantity(rs.getInt(3));
                od.setOrder_id(rs.getInt(4));
                od.setProduct_id(rs.getInt(5));
                od.setCreate_date(rs.getString(6));
                od.setProduct(pd.getProductByID(od.getProduct_id()));
                list.add(od);
            }
            connection.close();
            return list;
        } catch (SQLException ex) {

        }
        return null;
    }
    public ArrayList<OrderDetail> GetAllOrderDetailByOrderId(int order_id) {
        ArrayList<OrderDetail> lord = new ArrayList<>();
        ProductDao pd = new ProductDao();
        try {
            String sql = "select * from order_detail where order_id = " + order_id;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()){
             OrderDetail ord= new OrderDetail(rs.getInt(1), rs.getFloat(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6));
             ord.setProduct(pd.getProductByID(ord.getProduct_id()));
             ord.setFeedback_Status(rs.getInt(7));
             lord.add(ord);
             }
        } catch (SQLException ex) {
        }
        return lord;
    }
    
    public void changeFeedbackOrderDetail(String productID, int orderID){
        try {
            String sql = "UPDATE `onlineshop`.`order_detail` SET `FeedBack_Status` = '1' WHERE `product_id` =  "+productID+" and order_id = "+orderID+";";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (SQLException ex) {
        }
    }
//    public static void main(String[] args) {
//        OrderDetailDao od = new OrderDetailDao();
//        System.out.println(od.GetAllOrderDetailByOrderId(4).size());
//    }
}
