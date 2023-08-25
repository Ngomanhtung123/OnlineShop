/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;
import Model.Category;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author vieta
 */
public class CategoryDao extends DBcontext{
    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        try {
            String sql = "select * from category";
            Statement stm = connection.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Category category1 = new Category();
                category1.setCategory_id(rs.getInt(1));
                category1.setCategory_name(rs.getString(2));
                list.add(category1);
            }
        } catch (SQLException ex) {
        }
        return list;
    }
//    public static void main(String[] args) {
//        CategoryDao cd = new CategoryDao();
//        System.out.println(cd.getAllCategories().size());
//    }
    public String getCategory_name(int Category_id){
        List<Category> l = getAllCategories();
        for (Category o : l) {
            if(o.getCategory_id()==Category_id){
            return o.getCategory_name();
            }
        }
        return null;
    }
}
