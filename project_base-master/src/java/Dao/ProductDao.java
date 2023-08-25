/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Blog;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Product;

/**
 *
 * @author vieta
 */
public class ProductDao extends DBcontext {

    //get 
    public List<Product> getProductNew() {
        List<Product> list = new ArrayList<>();
        CategoryDao d = new CategoryDao();
        try {
            String sql = "select * from product where product_Status = 1 order by date_add desc, create_date desc limit 6 ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pr = new Product();
                //==================================
                pr.setProduct_id(rs.getInt(1));
                pr.setName_product(rs.getString(2));
                pr.setOriginal_prices(rs.getFloat(3));
                pr.setSale_prices(rs.getFloat(4));
                pr.setThumbnail(rs.getString(7));
                pr.setBrief_infor(rs.getString(8));
                list.add(pr);
            }
        } catch (SQLException ex) {

        }
        
        return list;
    }
//    public static void main(String[] args) {
//            ProductDao a = new ProductDao();
//            System.out.println(a.getProductNew().size()+"sang");
//    }

    public Product getProductByid(int id) {
        CategoryDao d = new CategoryDao();
        try {
            String sql = "select * from product where product_id = "+id+" ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pr = new Product();
                //==================================
                pr.setProduct_id(rs.getInt(1));
                pr.setName_product(rs.getString(2));
                pr.setOriginal_prices(rs.getFloat(3));
                pr.setSale_prices(rs.getFloat(4));
                pr.setQuantity(rs.getInt(5));
                pr.setCategory_name(d.getCategory_name(rs.getInt(6)));
                pr.setThumbnail(rs.getString(7));
                pr.setBrief_infor(rs.getString(8));
                pr.setProduct_detail(rs.getString(9));
                pr.setDate_add(rs.getString(10));
                pr.setProduct_Status(rs.getInt(11));
                pr.setCreate_date(rs.getString(12));
                pr.setImg_product(rs.getString(13));
                return pr;
            }
        } catch (SQLException ex) {

        }
        return null;
    }

    public List<String> getimg(String img) {
        String[] imgl = img.split(",");
        List<String> imgl1 = new ArrayList<String>();
        for (int i = 0; i < imgl.length; i++) {
            imgl1.add(imgl[i].trim());
        }
        return imgl1;
    }

    public Product getlastproduct() {
        CategoryDao d = new CategoryDao();
        List<Product> lp = new ArrayList<>();
        try {
            String sql = "select * from product where product_Status = 1 order by date_add desc, create_date desc limit 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pr = new Product();
                //==================================
                pr.setProduct_id(rs.getInt(1));
                pr.setName_product(rs.getString(2));
                pr.setOriginal_prices(rs.getFloat(3));
                pr.setSale_prices(rs.getFloat(4));
                pr.setQuantity(rs.getInt(5));
                pr.setCategory_name(d.getCategory_name(rs.getInt(6)));
                pr.setThumbnail(rs.getString(7));
                pr.setBrief_infor(rs.getString(8));
                pr.setProduct_detail(rs.getString(9));
                pr.setDate_add(rs.getString(10));
                pr.setProduct_Status(rs.getInt(11));
                pr.setCreate_date(rs.getString(12));
                pr.setImg_product(rs.getString(13));
                return pr;
            }
        } catch (SQLException ex) {

        }
        return null;
    }

    public List<Product> GetListLastProduct() {
        CategoryDao d = new CategoryDao();
        List<Product> lp = new ArrayList<>();
        try {
            String sql = "select * from product where product_Status = 1 order by date_add desc, create_date desc limit 3";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pr = new Product();
                //==================================
                pr.setProduct_id(rs.getInt(1));
                pr.setName_product(rs.getString(2));
                pr.setOriginal_prices(rs.getFloat(3));
                pr.setSale_prices(rs.getFloat(4));
                pr.setQuantity(rs.getInt(5));
                pr.setCategory_name(d.getCategory_name(rs.getInt(6)));
                pr.setThumbnail(rs.getString(7));
                pr.setBrief_infor(rs.getString(8));
                pr.setProduct_detail(rs.getString(9));
                pr.setDate_add(rs.getString(10));
                pr.setProduct_Status(rs.getInt(11));
                pr.setCreate_date(rs.getString(12));
                pr.setImg_product(rs.getString(13));
                lp.add(pr);
            }
            return lp;
        } catch (SQLException ex) {

        }
        return null;
    }

    public List<Product> GetAllProductOrder() {
        List<Product> lp = new ArrayList<>();
        try {
            String sql = "select * from product where product_Status = 1 order by date_add desc, create_date desc;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pr = new Product();
                //==================================
                pr.setProduct_id(rs.getInt(1));
                pr.setName_product(rs.getString(2));
                pr.setOriginal_prices(rs.getFloat(3));
                pr.setSale_prices(rs.getFloat(4));
                pr.setQuantity(rs.getInt(5));
                pr.setThumbnail(rs.getString(7));
                pr.setBrief_infor(rs.getString(8));
                pr.setProduct_detail(rs.getString(9));
                lp.add(pr);
            }
            return lp;
        } catch (SQLException ex) {

        }
        return null;
    }

    public List<Product> GetAllProductOrder(int page) {
        List<Product> lp = new ArrayList<>();
        CategoryDao d = new CategoryDao();
        page = (page - 1) * 12;
        try {
            String sql = "select * from product where product_Status = 1 order by date_add desc, create_date desc limit " + page + ",12;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pr = new Product();
                //==================================
                pr.setProduct_id(rs.getInt(1));
                pr.setName_product(rs.getString(2));
                pr.setOriginal_prices(rs.getFloat(3));
                pr.setSale_prices(rs.getFloat(4));
                pr.setQuantity(rs.getInt(5));
                pr.setThumbnail(rs.getString(7));
                pr.setBrief_infor(rs.getString(8));
                pr.setProduct_detail(rs.getString(9));
                lp.add(pr);
            }
            return lp;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Product> GetProductsOrderAandSearch(int page, String search, boolean check, int low, int high, boolean check2) {
        List<Product> lp = new ArrayList<>();
        CategoryDao d = new CategoryDao();
        String sql;
        PreparedStatement st;
        try {
            if (check2 == false) {
                if (search == null) {
                    System.out.println("1");
                    sql = "select * from product order by date_add desc, create_date desc;";
                    st = connection.prepareStatement(sql);
                } else {
                    //if check is true will search by tittle of blogs 
                    if (check == true) {
                        System.out.println("2");
                        sql = "select * from product where name_product like '%" + search + "%' order by date_add desc, create_date desc ;";
                        st = connection.prepareStatement(sql);

                        st.setString(1, "'%" + search + "%'");
                    } else { //if check is false will search by categories of blog
                        System.out.println("3");
                        sql = "select * from product where category_id = " + search + " order by date_add desc, create_date desc ;";
                        System.out.println(sql);
                        st = connection.prepareStatement(sql);
                    }
                }
            } else {
                if (search == null) {
                    System.out.println("3");
                    sql = "select * from product sale_prices between " + low + " and " + high + " order by date_add desc, create_date desc;";
                    st = connection.prepareStatement(sql);
                } else {
                    //if check is true will search by tittle of blogs 
                    if (check == true) {
                        System.out.println("5");
                        sql = "select * from product where name_product like '%" + search + "%' and sale_prices between " + low + " and " + high + " order by date_add desc, create_date desc ;";
                        st = connection.prepareStatement(sql);

                    } else {
                        System.out.println("6");//if check is false will search by categories of blog
                        sql = "select * from product where category_id like " + search + " and sale_prices between " + low + " and " + high + " order by date_add desc, create_date desc ;";
                        st = connection.prepareStatement(sql);
                    }
                }
            }
            System.out.println(sql);
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pr = new Product();
                //==================================
                pr.setProduct_id(rs.getInt(1));
                pr.setName_product(rs.getString(2));
                pr.setOriginal_prices(rs.getFloat(3));
                pr.setSale_prices(rs.getFloat(4));
                pr.setQuantity(rs.getInt(5));
                pr.setCategory_name(d.getCategory_name(rs.getInt(6)));
                pr.setThumbnail(rs.getString(7));
                pr.setBrief_infor(rs.getString(8));
                pr.setProduct_detail(rs.getString(9));
                pr.setDate_add(rs.getString(10));
                pr.setProduct_Status(rs.getInt(11));
                pr.setCreate_date(rs.getString(12));
                pr.setImg_product(rs.getString(13));
                lp.add(pr);
            }
            List<Product> l2 = getProductByPage(lp, page);
            return l2;
        } catch (SQLException ex) {
            System.out.println("loi sql");
        }
        return null;
    }

    public List<Product> getProductByPage(List<Product> l, int page) {
        List<Product> l2 = new ArrayList<>();
        int i = (page - 1) * 12;
        for (int j = i; j < i + 12; j++) {
            if (j < l.size()) {
                l2.add(l.get(j));
            } else {
                break;
            }
        }
        return l2;
    }

    public int getsize(String search, boolean check, int low, int high, boolean check2) {
        List<Product> lp = new ArrayList<>();
        CategoryDao d = new CategoryDao();
        String sql;
        PreparedStatement st;
        try {
            if (check2 == false) {
                if (search == null) {
                    System.out.println("1");
                    sql = "select * from product order by date_add desc, create_date desc;";
                    st = connection.prepareStatement(sql);
                } else {
                    //if check is true will search by tittle of blogs 
                    if (check == true) {
                        System.out.println("2");
                        sql = "select * from product where name_product like '%" + search + "%' order by date_add desc, create_date desc ;";
                        st = connection.prepareStatement(sql);

                        st.setString(1, "'%" + search + "%'");
                    } else { //if check is false will search by categories of blog
                        System.out.println("3");
                        sql = "select * from product where category_id = " + search + " order by date_add desc, create_date desc ;";
                        System.out.println(sql);
                        st = connection.prepareStatement(sql);
                    }
                }
            } else {
                if (search == null) {
                    System.out.println("3");
                    sql = "select * from product sale_prices between " + low + " and " + high + " order by date_add desc, create_date desc;";
                    st = connection.prepareStatement(sql);
                } else {
                    //if check is true will search by tittle of blogs 
                    if (check == true) {
                        System.out.println("5");
                        sql = "select * from product where name_product like '%" + search + "%' and sale_prices between " + low + " and " + high + " order by date_add desc, create_date desc ;";
                        st = connection.prepareStatement(sql);

                    } else {
                        System.out.println("6");//if check is false will search by categories of blog
                        sql = "select * from product where category_id like " + search + " and sale_prices between " + low + " and " + high + " order by date_add desc, create_date desc ;";
                        st = connection.prepareStatement(sql);
                    }
                }
            }
            System.out.println(sql);
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pr = new Product();
                //==================================
                pr.setProduct_id(rs.getInt(1));
                pr.setName_product(rs.getString(2));
                pr.setOriginal_prices(rs.getFloat(3));
                pr.setSale_prices(rs.getFloat(4));
                pr.setQuantity(rs.getInt(5));
                pr.setCategory_name(d.getCategory_name(rs.getInt(6)));
                pr.setThumbnail(rs.getString(7));
                pr.setBrief_infor(rs.getString(8));
                pr.setProduct_detail(rs.getString(9));
                pr.setDate_add(rs.getString(10));
                pr.setProduct_Status(rs.getInt(11));
                pr.setCreate_date(rs.getString(12));
                pr.setImg_product(rs.getString(13));
                lp.add(pr);
            }
            //List<Product> l2 = getProductByPage(lp, page);
            return lp.size();
        } catch (SQLException ex) {
            System.out.println("loi sql");
        }
        return 0;
    }

    public Product getProductByID(int id) {
        CategoryDao d = new CategoryDao();
        try {
            String sql = "select * from product where product_id = " + id + "  ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pr = new Product();
                //==================================
                pr.setProduct_id(rs.getInt(1));
                pr.setName_product(rs.getString(2));
                pr.setOriginal_prices(rs.getFloat(3));
                pr.setSale_prices(rs.getFloat(4));
                pr.setQuantity(rs.getInt(5));
                pr.setCategory_name(d.getCategory_name(rs.getInt(6)));
                pr.setThumbnail(rs.getString(7));
                pr.setBrief_infor(rs.getString(8));
                pr.setProduct_detail(rs.getString(9));
                pr.setDate_add(rs.getString(10));
                pr.setProduct_Status(rs.getInt(11));
                pr.setCreate_date(rs.getString(12));
                pr.setImg_product(rs.getString(13));
                return pr;
            }
        } catch (SQLException ex) {

        }
        return null;
    }

    public boolean changeQuantity(int product_id, int cquantity) {
        Product pr = getProductByID(product_id);
        if(pr.getQuantity()<cquantity){
            return false;
        }
        String sql = "UPDATE product SET quantity = quantity - " + cquantity+" WHERE product_id = "+product_id+";";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    public boolean AddQuantity(int product_id, int cquantity){
        Product pr = getProductByID(product_id);
        if(pr.getQuantity()<cquantity){
            return false;
        }
        String sql = "UPDATE product SET quantity = quantity + " + cquantity+" WHERE product_id = "+product_id+";";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    public List<Product> getProductByOrderID(String idp){
    CategoryDao d = new CategoryDao();
    List<Product> listproduct = new ArrayList<Product>();
        try {
            String sql = "select c.* from orders a join order_detail b on a.order_id=b.order_id join product c on b.product_id =  c.product_id where a.order_id = "+idp+";";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pr = new Product();
                //==================================
                pr.setProduct_id(rs.getInt(1));
                pr.setName_product(rs.getString(2));
                pr.setOriginal_prices(rs.getFloat(3));
                pr.setSale_prices(rs.getFloat(4));
                pr.setQuantity(rs.getInt(5));
                pr.setCategory_name(d.getCategory_name(rs.getInt(6)));
                pr.setThumbnail(rs.getString(7));
                pr.setBrief_infor(rs.getString(8));
                pr.setProduct_detail(rs.getString(9));
                pr.setDate_add(rs.getString(10));
                pr.setProduct_Status(rs.getInt(11));
                pr.setCreate_date(rs.getString(12));
                pr.setImg_product(rs.getString(13));
                listproduct.add(pr);
            }
            return listproduct;
        } catch (SQLException ex) {

        }
        return null;
    }
    
}
