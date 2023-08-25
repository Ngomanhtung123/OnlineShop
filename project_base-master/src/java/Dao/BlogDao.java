/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Helper.DBHelper;
import Model.Blog;
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
public class BlogDao extends DBcontext {

    private UserDao ud = new UserDao();
    
    public String gettt(int id){
         try {
            String sql = "select * from blog where blog_id = "+id+" ;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog bl = new Blog();
                bl.setContent(rs.getString(3));
                return bl.getContent();
            }
        } catch (SQLException ex) {

        }
        return null;
    }
    public static void main(String[] args) {
        BlogDao bd = new BlogDao();
        String msg = bd.gettt(13);
        System.out.println(msg);
    }
    public void update(String id, String title, String cateID, String status, String content, String fileName, int uid) {
        try {
            String query = "UPDATE `onlineshop`.`blog`\n"
                    + "SET\n"
                    + "`tittle` = ?,\n"
                    + "`content` = ?,\n"
                    + "`update_date` = curdate(),\n"
                    + "`thumbnail` = ?,\n"
                    + "`category_id` = ?,\n"
                    + "`status` = ?,\n"
                    + "`update_by` = ?\n"
                    + "WHERE `blog_id` = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, title);
            statement.setString(2, content);
            statement.setString(3, fileName);
            statement.setInt(4, Integer.parseInt(cateID));
            statement.setInt(5, status.equals("1") ? 1 : 0);
            statement.setInt(6, uid);
            statement.setInt(7, Integer.parseInt(id));
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error");
        }
    }
    public void insert(String title, String cateID, String status, String content, String brief, String fileName , int uid) {
        try {
            String query = "INSERT INTO `onlineshop`.`blog`\n"
                    + "(\n"
                    + "`tittle`,\n"
                    + "`content`,\n"
                    + "`author_id`,\n"
                    + "`update_date`,\n"
                    + "`thumbnail`,\n"
                    + "`brief_infor`,\n"
                    + "`category_id`,\n"
                    + "`create_date`,\n"
                    + "`status`)\n"
                    + "VALUES\n"
                    + "(?,?, "+uid+",curdate(),?,?,?,curdate(),?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, title);
            statement.setString(2, content);
            statement.setString(3, fileName);
            statement.setString(4, brief);
            statement.setInt(5, Integer.parseInt(cateID));
            statement.setInt(6, status.equals("1") ? 1 : 0);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error");
        }
    }
    public void ChangeStatusBlogDAO(Blog blog, int uid) {
        try {
            int status;
            if(blog.getStatus()==true){
            status = 0;
            }else{
            status = 1;
            }
            String query = "UPDATE `onlineshop`.`blog`\n"
                    + "SET\n"
                    + "`status` = ?,\n"
                    + "`update_by` = ?,\n"
                    + "`update_date` = curdate()\n"
                    + "WHERE `blog_id` = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, status);
            statement.setInt(2, uid);
            statement.setInt(3, blog.getBlog_id());
            statement.executeUpdate();
        } catch (SQLException e) {

        }
    }
    
    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        CategoryBlogDao d = new CategoryBlogDao();
        try {
            String sql = "select * from blog where status = 1;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog bl = new Blog();
                bl.setBlog_id(rs.getInt(1));
                bl.setTittle(rs.getString(2));
                bl.setContent(rs.getString(3));
                bl.setAuthor_id(rs.getInt(4));
                bl.setUpdate_by(rs.getInt(5));
                bl.setUpdate_date(rs.getString(6));
                bl.setThumbnail(rs.getString(7));
                bl.setBrief_infor(rs.getString(8));
                bl.setCategory_name(d.getNameById(rs.getInt(9)));
                bl.setCreate_date(rs.getString(10));
                bl.setNameAuthor(ud.getNameUserById(bl.getAuthor_id()));
                list.add(bl);
            }
        } catch (SQLException ex) {

        }
        return list;
    }

    public List<Blog> getAllBlogNewtop6() {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "select * from blog where status = 1 order by update_date desc, create_date desc limit 6;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog bl = new Blog();
                bl.setBlog_id(rs.getInt(1));
                bl.setTittle(rs.getString(2));
                bl.setContent(rs.getString(3));
                bl.setThumbnail(rs.getString(7));
                bl.setBrief_infor(rs.getString(8));
                list.add(bl);
            }
        } catch (SQLException ex) {

        }
        return list;
    }
//    public static void main(String[] args) {
//        BlogDao bd = new BlogDao();
//        System.out.println(bd.getAllBlogNewtop6().size());
//        ;
//    }
    // lay 1 blog moi nhat
    public Blog getBlogNew() {
        List<Blog> list = getAllBlogNewtop6();
        return list.get(0);
    }
    public List<Blog> GetAllBlogWithSearch(String categoryID, String authorID, String status, String search, String sort) {
        CategoryBlogDao cbd = new CategoryBlogDao();
        List<Blog> list = new ArrayList<>();
        List<Object> listParams = new ArrayList<>();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("select * from blog");
            if ((categoryID != null && !categoryID.trim().isEmpty())
                    || (authorID != null && !authorID.trim().isEmpty())
                    || (status != null && !status.trim().isEmpty())
                    || (search != null && !search.trim().isEmpty())) {
                sql.append(" where 1 = 1 ");
            }
            if (categoryID != null && !categoryID.trim().isEmpty()) {
                sql.append(" and category_id = ?");
                listParams.add(Integer.parseInt(categoryID));
            }
            if (authorID != null && !authorID.trim().isEmpty()) {
                sql.append(" and author_id = ?");
                listParams.add(Integer.parseInt(authorID));
            }
            if (status != null && !status.trim().isEmpty() && !status.equals("2")) {
                sql.append(" and `status` = ? ");
                listParams.add(Integer.parseInt(status));
            }
            if (search != null && !search.trim().isEmpty()) {
                sql.append(" and tittle like ? ");
                listParams.add("%" + search + "%");
            }
            if (sort != null && !sort.trim().isEmpty()) {
                sql.append(" order by " + sort);
            }
            PreparedStatement ptm = connection.prepareStatement(sql.toString());
            DBHelper.mapParams(ptm, listParams);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlog_id(rs.getInt(1));
                blog.setTittle(rs.getString(2));
                blog.setContent(rs.getString(3));
                blog.setAuthor_id(rs.getInt(4));
                blog.setUpdate_by(rs.getInt(5));
                blog.setUpdate_date(rs.getString(6));
                blog.setThumbnail(rs.getString(7));
                blog.setBrief_infor(rs.getString(8));
                blog.setCategory_name(cbd.GetNameCategoryBlogByID(rs.getInt(9)));
                blog.setCreate_date(rs.getString(10));
                blog.setNameAuthor(ud.getNameUserById(blog.getAuthor_id()));
                blog.setStatus(rs.getInt(11) == 1);
                list.add(blog);
            }
        } catch (SQLException ex) {
        }
        return list;
    }

    public List<Blog> GetBySearch(String tittleOrCategories, int page, boolean check) {
        List<Blog> list = new ArrayList<>();
        CategoryBlogDao cbd =new CategoryBlogDao();
        try {
            PreparedStatement st;
            String sql;
            if (tittleOrCategories == null) {
                sql = "select *from blog where status = 1";
                st = connection.prepareStatement(sql);
            } else {
                //if check is true will search by tittle of blogs 
                if (check == true) {
                    sql = "select *from blog where tittle like ? and status = 1";
                    st = connection.prepareStatement(sql);

                    st.setString(1, "%" + tittleOrCategories + "%");
                } else { //if check is false will search by categories of blog
                    sql = "select *from blog where category_id like ? and status = 1";
                    st = connection.prepareStatement(sql);

                    st.setString(1, "%" + tittleOrCategories + "%");
                }
            }
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlog_id(rs.getInt(1));
                blog.setTittle(rs.getString(2));
                blog.setContent(rs.getString(3));
                blog.setAuthor_id(rs.getInt(4));
                blog.setUpdate_by(rs.getInt(5));
                blog.setUpdate_date(rs.getString(6));
                blog.setThumbnail(rs.getString(7));
                blog.setBrief_infor(rs.getString(8));
                blog.setCategory_name(cbd.GetNameCategoryBlogByID(rs.getInt(9)));
                blog.setCreate_date(rs.getString(10));
                blog.setNameAuthor(ud.getNameUserById(blog.getAuthor_id()));
                list.add(blog);
            }
        } catch (SQLException ex) {
        }
        list = getBlogByPage(list, page);
        return list;
    }

    public int GetSize(String tittleOrCategories, boolean check) {
        List<Blog> list = new ArrayList<>();
        try {
            PreparedStatement st;
            String sql;
            if (tittleOrCategories == null) {
                sql = "select *from blog where status = 1";
                st = connection.prepareStatement(sql);
            } else {
                //if check is true will search by tittle of blogs 
                if (check == true) {
                    sql = "select *from blog where tittle like ? and status = 1";
                    st = connection.prepareStatement(sql);

                    st.setString(1, "%" + tittleOrCategories + "%");
                } else { //if check is false will search by categories of blog
                    sql = "select *from blog where category_id like ? and status = 1";
                    st = connection.prepareStatement(sql);

                    st.setString(1, "%" + tittleOrCategories + "%");
                }
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlog_id(rs.getInt(1));
                blog.setTittle(rs.getString(2));
                blog.setContent(rs.getString(3));
                blog.setAuthor_id(rs.getInt(4));
                blog.setUpdate_by(rs.getInt(5));
                blog.setUpdate_date(rs.getString(6));
                blog.setThumbnail(rs.getString(7));
                blog.setBrief_infor(rs.getString(8));
                blog.setCategory_name(rs.getString(9));
                blog.setCreate_date(rs.getString(10));
                blog.setNameAuthor(ud.getNameUserById(blog.getAuthor_id()));

                list.add(blog);
            }
        } catch (SQLException ex) {
        }
        return list.size();
    }

//    public List<Blog> GetBlogByTittleAndPage(String tittle, int page) {
//        List<Blog> list = new ArrayList<>();
//        if (page == 1) {
//            page = 0;
//        } else {
//            page = (page - 1) * 3;
//        }
//        try {
//            String sql = "select *from blog where tittle like ? limit " + page + ", 3;";
//            PreparedStatement st = connection.prepareStatement(sql);
//
//            st.setString(1, "%" + tittle + "%");
//
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Blog blog = new Blog();
//                blog.setBlog_id(rs.getInt(1));
//                blog.setTittle(rs.getString(2));
//                blog.setContent(rs.getString(3));
//                blog.setAuthor_id(rs.getInt(4));
//                blog.setUpdate_by(rs.getInt(5));
//                blog.setUpdate_date(rs.getString(6));
//                blog.setThumbnail(rs.getString(7));
//                blog.setBrief_infor(rs.getString(8));
//                blog.setCategory_name(rs.getString(9));
//                blog.setCreate_date(rs.getString(10));
//
//                list.add(blog);
//            }
//        } catch (SQLException ex) {
//        }
//        return list;
//    }
    public List<Blog> getAllBlogByCategoryID(int id) {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "select * from blog where category_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlog_id(rs.getInt(1));
                blog.setTittle(rs.getString(2));
                blog.setContent(rs.getString(3));
                blog.setAuthor_id(rs.getInt(4));
                blog.setUpdate_by(rs.getInt(5));
                blog.setUpdate_date(rs.getString(6));
                blog.setThumbnail(rs.getString(7));
                blog.setBrief_infor(rs.getString(8));
                blog.setCategory_name(rs.getString(9));
                blog.setCreate_date(rs.getString(10));
                blog.setNameAuthor(ud.getNameUserById(blog.getAuthor_id()));

                list.add(blog);
            }
        } catch (SQLException ex) {
        }
        return list;
    }

    public List<Blog> getBlogByPage(List<Blog> l, int page) {
        List<Blog> l2 = new ArrayList<>();
        int i = (page - 1) * 3;
        for (int j = i; j < i + 3; j++) {
            if (j < l.size()) {
                l2.add(l.get(j));
            } else {
                break;
            }
        }
        return l2;
    }

//    public static void main(String[] args) {
//        BlogDao d = new BlogDao();
//        List<Blog> l = d.getAllBlogByCategoryID(2);
//        List<Blog> l2 = d.getBlogByPage(l, 1);
//        for (Blog b : l2) {
//            System.out.println(b.getBlog_id());
//        }
//    }
    public List<Blog> GetAllBlog() {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "select * from blog where status = 1 order by update_date, create_date desc";
            Statement stm = connection.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlog_id(rs.getInt(1));
                blog.setTittle(rs.getString(2));
                blog.setContent(rs.getString(3));
                blog.setAuthor_id(rs.getInt(4));
                blog.setUpdate_by(rs.getInt(5));
                blog.setUpdate_date(rs.getString(6));
                blog.setThumbnail(rs.getString(7));
                blog.setBrief_infor(rs.getString(8));
                blog.setCategory_name(rs.getString(9));
                blog.setCreate_date(rs.getString(10));
                blog.setNameAuthor(ud.getNameUserById(blog.getAuthor_id()));

                list.add(blog);
            }
        } catch (SQLException ex) {
        }
        return list;
    }

    public Blog getBlogById(int blogId) {
        CategoryBlogDao d = new CategoryBlogDao();

        try {
            String query = "SELECT * FROM blog WHERE blog_id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, blogId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlog_id(rs.getInt(1));
                blog.setTittle(rs.getString(2));
                blog.setContent(rs.getString(3));
                blog.setAuthor_id(rs.getInt(4));
                blog.setUpdate_by(rs.getInt(5));
                blog.setUpdate_date(rs.getString(6));
                blog.setThumbnail(rs.getString(7));
                int status = rs.getInt(11);
                if(status==1){
                blog.setStatus(true);
                }else{
                blog.setStatus(false);    
                }
                blog.setBrief_infor(rs.getString(8));
                blog.setCategory_name(d.GetNameCategoryBlogByID(rs.getInt(9)));
                blog.setCreate_date(rs.getString(10));
                blog.setNameAuthor(ud.getNameUserById(blog.getAuthor_id()));
                return blog;
            }
        } catch (SQLException e) {

        }
        return null;
    }

//    public static void main(String[] args) {
//        BlogDao d = new BlogDao();
//        System.out.println(d.getBlogById(1).getTittle());
//    }
}
