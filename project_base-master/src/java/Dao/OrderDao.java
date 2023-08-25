/*`

 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Order;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vieta
 */
public class OrderDao extends DBcontext {

    public Order getOrderByID(String id) {
        UserDao ud = new UserDao();
        try {
            String sql = "select * from orders where order_id = " + id + ";";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrder_id(rs.getInt(1));
                o.setOrder_date(rs.getString(2));
                o.setUser_id(rs.getInt(3));
                o.setFullname(rs.getString(4));
                o.setEmail(rs.getString(5));
                o.setMobile(rs.getString(6));
                o.setAddress(rs.getString(7));
                o.setStatus_order(rs.getInt(8));
                o.setCreate_date(rs.getString(9));
                o.setTotalCost(rs.getDouble(10));
                o.setGender(rs.getInt(11));
                o.setSale_id(rs.getInt(12));
                o.setSale_Name(ud.getNameUserById(o.getSale_id()));
                o.setFirstProductName(getFirstProductName(o.getOrder_id()));
                o.setNumberProduct(getNumberProductInOrder(o.getOrder_id()));
                return o;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public int getNumberProductInOrder(int orders_iD) {
        try {
            String sql = "SELECT count(p.name_product) FROM order_detail  od join product p on od.product_id = p.product_id where od.order_id = " + orders_iD + " ;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1) - 1;
            }
        } catch (Exception e) {
            return 0;
        }
        return 0;
    }

//    public static void main(String[] args) {
//        OrderDao d = new OrderDao();
//        //System.out.println(d.getFirstProductName(1));
//        System.out.println(d.getOrderbySearch("2023-6-30", null, "0", null, 1, 10).size());
//    }
    public List<Order> GetAllOrderBysaleID(int sale_id) {
        String sql = "select * from orders ";
        boolean check = false;
        List<Order> list = new ArrayList<>();
        UserDao ud = new UserDao();
        User u = ud.getUserById(sale_id);
        if (u.getRole_id() == 4) {
            check = true;
            sql = sql + " where sale_id = " + sale_id + "";
        }
        System.out.println(sql);
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrder_id(rs.getInt(1));
                o.setOrder_date(rs.getString(2));
                o.setUser_id(rs.getInt(3));
                o.setFullname(rs.getString(4));
                o.setEmail(rs.getString(5));
                o.setMobile(rs.getString(6));
                o.setAddress(rs.getString(7));
                o.setStatus_order(rs.getInt(8));
                o.setCreate_date(rs.getString(9));
                o.setTotalCost(rs.getDouble(10));
                o.setGender(rs.getInt(11));
                o.setSale_id(rs.getInt(12));
                o.setFirstProductName(getFirstProductName(o.getOrder_id()));
                o.setSale_Name(ud.getNameUserById(o.getSale_id()));
                o.setNumberProduct(getNumberProductInOrder(o.getOrder_id()));
                list.add(o);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public void ChangeStatusOrderById(int order_id, int status_order) {

        try {
            String sql = "UPDATE orders SET status_order=" + status_order + " WHERE order_id = " + order_id + ";";
            System.out.println(sql);
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public int getsize(int sale_id) {
        String sql = "select * from orders ";
        boolean check = false;
        List<Order> list = new ArrayList<>();
        UserDao ud = new UserDao();
        User u = ud.getUserById(sale_id);
        if (u.getRole_id() == 4) {
            check = true;
            sql = sql + " where sale_id = " + sale_id + "";
        }
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrder_id(rs.getInt(1));
                o.setOrder_date(rs.getString(2));
                o.setUser_id(rs.getInt(3));
                o.setFullname(rs.getString(4));
                o.setEmail(rs.getString(5));
                o.setMobile(rs.getString(6));
                o.setAddress(rs.getString(7));
                o.setStatus_order(rs.getInt(8));
                o.setCreate_date(rs.getString(9));
                o.setTotalCost(rs.getDouble(10));
                o.setGender(rs.getInt(11));
                o.setSale_id(rs.getInt(12));
                o.setFirstProductName(getFirstProductName(o.getOrder_id()));
                o.setSale_Name(ud.getNameUserById(o.getSale_id()));
                o.setNumberProduct(getNumberProductInOrder(o.getOrder_id()));
                list.add(o);
            }

        } catch (Exception e) {
        }
        return list.size();
    }

    public int getsize(String startdate, String finishdate, String status, String SaleName, int sale_id) {
        String sql = "select * from orders ";
        boolean check = false;
        List<Order> list = new ArrayList<>();
        UserDao ud = new UserDao();
        User u = ud.getUserById(sale_id);
        if (u.getRole_id() == 4) {
            check = true;
        }
        String where = "";
        boolean test = false;
        if (!startdate.equals("")) {
            where = where + " where order_date >= '" + startdate + "'";
            System.out.println(where);
        }
        if (!finishdate.equals("")) {
            if (where != "") {
                where = where + " and order_date <= '" + finishdate + "'";
                System.out.println(where);
            } else {
                where = where + " where order_date <= '" + finishdate + "'";
                System.out.println(where);
            }
        }
        if (!status.equals("0")) {
            if (where != "") {
                where = where + " and status_order = " + status + "";
                System.out.println(where);
            } else {
                where = where + " where status_order = " + status + "";
                System.out.println(where);
            }
        }
        if (check == true) {
            if (where != "") {
                where = where + " and sale_id = " + sale_id + "";
                System.out.println(where);
            } else {
                where = where + " where sale_id = " + sale_id + "";
                System.out.println(where);
            }
        }
        sql = sql + where;
        System.out.println(sql);
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrder_id(rs.getInt(1));
                o.setOrder_date(rs.getString(2));
                o.setUser_id(rs.getInt(3));
                o.setFullname(rs.getString(4));
                o.setEmail(rs.getString(5));
                o.setMobile(rs.getString(6));
                o.setAddress(rs.getString(7));
                o.setStatus_order(rs.getInt(8));
                o.setCreate_date(rs.getString(9));
                o.setTotalCost(rs.getDouble(10));
                o.setGender(rs.getInt(11));
                o.setSale_id(rs.getInt(12));
                o.setFirstProductName(getFirstProductName(o.getOrder_id()));
                o.setSale_Name(ud.getNameUserById(o.getSale_id()));
                if (!SaleName.equals("")) {
                    if (o.getSale_Name().contains(SaleName)) {
                        list.add(o);
                    }
                } else {
                    list.add(o);
                }

            }

        } catch (Exception e) {
        }
        return list.size();

    }

    public int getSize(String id, String CustomerName, int sale_id) {
        try {
            String sql = "select * from orders ";
            boolean check = false;
            List<Order> list = new ArrayList<Order>();
            UserDao ud = new UserDao();
            User u = ud.getUserById(sale_id);
            if (u.getRole_id() == 4) {
                check = true;
            }
            String where = "";
            boolean test = false;
            if (!id.equals("")) {
                where = where + " where order_id = " + id + "";
                System.out.println(where);
            }
            if (!CustomerName.equals("")) {
                if (where != "") {
                    where = where + " and fullname like '%" + CustomerName + "%'";
                    System.out.println(where);
                } else {
                    where = where + " where fullname like '%" + CustomerName + "%'";
                    System.out.println(where);
                }
            }
            if (check == true) {
                if (where != "") {
                    where = where + " and sale_id = " + sale_id + "";
                    System.out.println(where);
                } else {
                    where = where + " where sale_id = " + sale_id + "";
                    System.out.println(where);
                }
            }
            sql = sql + where;
            System.out.println(sql);
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrder_id(rs.getInt(1));
                o.setOrder_date(rs.getString(2));
                o.setUser_id(rs.getInt(3));
                o.setFullname(rs.getString(4));
                o.setEmail(rs.getString(5));
                o.setMobile(rs.getString(6));
                o.setAddress(rs.getString(7));
                o.setStatus_order(rs.getInt(8));
                o.setCreate_date(rs.getString(9));
                o.setTotalCost(rs.getDouble(10));
                o.setGender(rs.getInt(11));
                o.setSale_id(rs.getInt(12));
                list.add(o);
            }
            return list.size();
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Order> getOrderbySearch(String id, String CustomerName, int page, int sale_id) {
        page = (page - 1) * 12;
        try {
            String sql = "select * from orders ";
            boolean check = false;
            List<Order> list = new ArrayList<Order>();
            UserDao ud = new UserDao();
            User u = ud.getUserById(sale_id);
            if (u.getRole_id() == 4) {
                check = true;
            }
            String where = "";
            boolean test = false;
            if (!id.equals("")) {
                where = where + " where order_id = " + id + "";
                System.out.println(where);
            }
            if (!CustomerName.equals("")) {
                if (where != "") {
                    where = where + " and fullname like '%" + CustomerName + "%'";
                    System.out.println(where);
                } else {
                    where = where + " where fullname like '%" + CustomerName + "%'";
                    System.out.println(where);
                }
            }
            if (check == true) {
                if (where != "") {
                    where = where + " and sale_id = " + sale_id + "";
                    System.out.println(where);
                } else {
                    where = where + " where sale_id = " + sale_id + "";
                    System.out.println(where);
                }
            }
            sql = sql + where + " limit " + page + ", 12";
            System.out.println(sql);
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrder_id(rs.getInt(1));
                o.setOrder_date(rs.getString(2));
                o.setUser_id(rs.getInt(3));
                o.setFullname(rs.getString(4));
                o.setEmail(rs.getString(5));
                o.setMobile(rs.getString(6));
                o.setAddress(rs.getString(7));
                o.setStatus_order(rs.getInt(8));
                o.setCreate_date(rs.getString(9));
                o.setTotalCost(rs.getDouble(10));
                o.setGender(rs.getInt(11));
                o.setSale_id(rs.getInt(12));
                o.setNumberProduct(getNumberProductInOrder(o.getOrder_id()));
                o.setFirstProductName(getFirstProductName(o.getOrder_id()));
                list.add(o);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Order> getOrderbySearch(String startdate, String finishdate, String status, String SaleName, int page, int sale_id) {
        page = (page - 1) * 12;
        String sql = "select * from orders ";
        boolean check = false;
        List<Order> list = new ArrayList<>();
        UserDao ud = new UserDao();
        User u = ud.getUserById(sale_id);
        if (u.getRole_id() == 4) {
            check = true;
        }
        String where = "";
        boolean test = false;
        if (!startdate.equals("")) {
            where = where + " where order_date >= '" + startdate + "'";
            System.out.println(where);
        }
        if (!finishdate.equals("")) {
            if (where != "") {
                where = where + " and order_date <= '" + finishdate + "'";
                System.out.println(where);
            } else {
                where = where + " where order_date <= '" + finishdate + "'";
                System.out.println(where);
            }
        }
        if (!status.equals("0")) {
            if (where != "") {
                where = where + " and status_order = " + status + "";
                System.out.println(where);
            } else {
                where = where + " where status_order = " + status + "";
                System.out.println(where);
            }
        }
        if (check == true) {
            if (where != "") {
                where = where + " and sale_id = " + sale_id + "";
                System.out.println(where);
            } else {
                where = where + " where sale_id = " + sale_id + "";
                System.out.println(where);
            }
        }
        sql = sql + where + " limit " + page + ", 12";
        System.out.println(sql);
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrder_id(rs.getInt(1));
                o.setOrder_date(rs.getString(2));
                o.setUser_id(rs.getInt(3));
                o.setFullname(rs.getString(4));
                o.setEmail(rs.getString(5));
                o.setMobile(rs.getString(6));
                o.setAddress(rs.getString(7));
                o.setStatus_order(rs.getInt(8));
                o.setCreate_date(rs.getString(9));
                o.setTotalCost(rs.getDouble(10));
                o.setGender(rs.getInt(11));
                o.setSale_id(rs.getInt(12));
                o.setFirstProductName(getFirstProductName(o.getOrder_id()));
                o.setSale_Name(ud.getNameUserById(o.getSale_id()));
                o.setNumberProduct(getNumberProductInOrder(o.getOrder_id()));
                if (!SaleName.equals("")) {
                    if (o.getSale_Name().contains(SaleName)) {
                        list.add(o);
                    }
                } else {
                    list.add(o);
                }

            }

        } catch (Exception e) {
        }
        return list;
    }

    public String getFirstProductName(int orders_iD) {
        try {
            String sql = "SELECT p.name_product FROM order_detail  od join product p on od.product_id = p.product_id\n"
                    + "where od.order_id = ? LIMIT 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orders_iD);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Order> getAllOrderByuId(int uid) {
        ArrayList<Order> ol = new ArrayList<>();
        String sql = " SELECT * FROM orders o\n"
                + "where o.user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9));
                o.setTotalCost(rs.getDouble(10));
                o.setFirstProductName(getFirstProductName(o.getOrder_id()));
                o.setGender(rs.getInt(11));
                ol.add(o);
            }
        } catch (Exception e) {
        }
        return ol;
    }

    public Order getOrderById(int order_id) {

        Order or = new Order();
        try {
            String sql = "select * from orders where order_id =' " + order_id + "'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                //==================================
                or.setOrder_id(rs.getInt(1));
                or.setOrder_date(rs.getString(2));
                or.setUser_id(rs.getInt(3));
                or.setFullname(rs.getString(4));
                or.setEmail(rs.getString(5));
                or.setMobile(rs.getString(6));
                or.setAddress(rs.getString(7));
                or.setStatus_order(rs.getInt(8));
                or.setCreate_date(rs.getString(9));
                or.setTotalCost(rs.getFloat(10));
            }
        } catch (SQLException ex) {

        }
        return or;
    }

    public List<Order> getAllOrderByUserId(int user_id) {
        List<Order> list = new ArrayList<>();
        CategoryDao d = new CategoryDao();
        try {
            String sql = "select * from orders where user_id = ' " + user_id + "'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order or = new Order();
                //==================================
                or.setOrder_id(rs.getInt(1));
                or.setOrder_date(rs.getString(2));
                or.setUser_id(rs.getInt(3));
                or.setFullname(rs.getString(4));
                or.setEmail(rs.getString(5));
                or.setMobile(rs.getString(6));
                or.setAddress(rs.getString(7));
                or.setStatus_order(rs.getInt(8));
                or.setCreate_date(rs.getString(9));
                or.setTotalCost(rs.getDouble(10));
                list.add(or);
            }
        } catch (SQLException ex) {

        }
        return list;
    }

    public void CreateOrder(int user_id, String fullname, String email, String mobile, String address, int status_order, float totalcost, int gender) {

        try {
            String sql = "INSERT INTO orders VALUES (NULL, CURRENT_DATE(), '" + user_id + "', '" + fullname + "', '" + email + "', '" + mobile + "', '" + address + "', '" + status_order + "', CURRENT_DATE(), '" + totalcost + "', '" + gender + "', null);";
            System.out.println(sql);
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public int GetIdOfLastOrders(int uid) {
        try {
            String sql = "select order_id from orders where user_id = " + uid + " order by order_id desc  limit 0, 1;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {

        }
        return -1;
    }

    public Order getLastOrderOfUser(int uid) {
        try {
            String sql = "select * from orders where user_id = " + uid + " order by order_date desc limit 0, 1;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9));
                o.setTotalCost(rs.getDouble(10));
                o.setFirstProductName(getFirstProductName(o.getOrder_id()));
                o.setGender(rs.getInt(11));
                return o;
            }
        } catch (SQLException ex) {

        }
        return null;

    }

    public void UpdateOrder(String id, String status_order) {
        if (status_order != null) {
            try {
                String sql = "update orders set status_order = " + status_order + " where order_id = " + id + "; ";
                PreparedStatement stm = connection.prepareStatement(sql);
                String mail = getOrderById(Integer.parseInt(id)).getEmail();
                System.out.println(sql);
                if (status_order.contains("3")) {
                    SendMail.send(mail, "Delivery successful", "Your order with id : " + id + "has been successfully delivered");
                }
                stm.executeUpdate(sql);

            } catch (SQLException ex) {
            }
        }
    }

    public void AssignOrder(String id, String saler) {
        try {
            String sql = "update orders set sale_id = " + saler + " where order_id = " + id + "; ";
            PreparedStatement stm = connection.prepareStatement(sql);
            System.out.println(sql);
            stm.executeUpdate(sql);
        } catch (SQLException ex) {
        }
    }

//    public static void main(String[] args) {
//        OrderDao d = new OrderDao();
//        List<Order> lo = d.getAllOrderByUserId(7);
//        for (Order order : lo) {
//            System.out.println(order.getSale_id());
//        }
//    }
}
