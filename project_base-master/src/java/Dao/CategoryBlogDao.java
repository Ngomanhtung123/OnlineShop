/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

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
public class CategoryBlogDao extends DBcontext{
    public List<CategoryBlog> getAllCategoryBlog(){
        List<CategoryBlog> lctb = new ArrayList<>();
        try{
        String sql = "select * from category_blog ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CategoryBlog cb = new CategoryBlog();
                cb.setCategory_id(rs.getInt(1));
                cb.setCategory_name(rs.getString(2));
                lctb.add(cb);
            }   
        } catch (SQLException ex) {
            
        }
        return lctb;
    }
    public String getNameById(int id){
    List<CategoryBlog> lctb = getAllCategoryBlog();
        for (CategoryBlog o : lctb) {
            if(o.getCategory_id()==id){
            return o.getCategory_name();
            }
        }
        return null;
    }
    public String GetNameCategoryBlogByID(int id) {
        
        List<CategoryBlog> list = new ArrayList<>();
        try {
            String sql = "select*from category_blog";
            Statement stm = connection.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                CategoryBlog category1 = new CategoryBlog();
                category1.setCategory_id(rs.getInt(1));
                category1.setCategory_name(rs.getString(2));
                list.add(category1);
            }
        } catch (SQLException ex) {
        }
        for (CategoryBlog o : list) {
            if (o.getCategory_id() == id) {
                return o.getCategory_name();
            }
        }
        return null;
    }
}
