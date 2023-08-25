/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Controller.Common.UserRegister;
import Helper.DBHelper;
import Model.Product;
import Model.User;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author vieta
 */
public class UserDao extends DBcontext {
    public boolean checkMailexists(String mail){
        try {
            String sql = "select * from user where email_address like '"+mail+"';";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                return true;
            }
            return false;
        } catch (Exception e) {
        }
        return false;
    }

    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    public boolean changeStatus(User u) {
        try {
            String sql = "UPDATE `onlineshop`.`user`\n"
                    + "SET\n"
                    + "`Status` = ?\n"
                    + "WHERE `user_id` = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, u.getStatus());
            stm.setInt(2, u.getUser_id());
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean AddNewUser(String fullname, String gender, String phone, String email, String address, String username, String password, String role, String img) {
        try {
            password = password_encryption(password);
            String key = generateRandomString(15);
            String sql;
            sql = " INSERT INTO user\n"
                    + "(key_user,fullname,gender,phone_number,email_address,address,username,password,avartar,role_id,Status,create_date)\n"
                    + "VALUES('" + key + "','" + fullname + "'," + gender + ",'" + phone + "','" + email + "','" + address + "','" + username + "','" + password + "','" + img + "'," + role + ",0,CURDATE());";
            System.out.println(sql);
            PreparedStatement stm = connection.prepareStatement(sql);
            SendMail.send(email, "Verify signup new user", "Click the link below to verify your account: <br> http://localhost:9999/ShoppingOnline/Verify?email=" + email + "&key=" + key);

            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean register(String fullname, String gender, String phone, String email, String address, String username, String password) {
        String key = generateRandomString(15);
        try {
            password = password_encryption(password);
            //String key = generateRandomString(15);
            String sql = " INSERT INTO `onlineshop`.`user`\n"
                    + "(`key_user`,`fullname`,`gender`,`phone_number`,`email_address`,`address`,`username`,`password`,`avartar`,`role_id`,`Status`,`create_date`)\n"
                    + "VALUES('" + key + "','" + fullname + "',b'" + gender + "','" + phone + "','" + email + "','" + address + "','" + username + "','" + password + "','https://iconape.com/wp-content/files/im/10836/svg/iconfinder_3_avatar_2754579.svg','2',b'0',CURDATE());";
            System.out.println(sql);

            PreparedStatement stm = connection.prepareStatement(sql);
            SendMail.send(email, "Verify signup new user", "Click the link below to verify your account: <br> http://localhost:9999/ShoppingOnline/Verify?email=" + email + "&key=" + key);

            stm.executeUpdate();  
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        SendMail.send(email, "Verify signup new user", "Click the link below to verify your account: <br> http://localhost:9999/ShoppingOnline/Verify?email=" + email + "&key=" + key);
        return true;
    }

    public boolean update(String role, String status, int uid) {
        try {
            String key = generateRandomString(15);
            String sql = "UPDATE `onlineshop`.`user`\n"
                    + "SET\n"
                    + "`key_user` = ?,\n"
                    + "`role_id` = ?,\n"
                    + "`Status` = ?\n"
                    + "WHERE `user_id` = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, key);
            stm.setInt(2, Integer.parseInt(role));
            stm.setInt(3, Integer.parseInt(status));
            stm.setInt(4, uid);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public String getNameUserById(int id) {
        try {
            String sql = "select fullname from User where user_id = " + id + " ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            String name = "";
            while (rs.next()) {
                name = rs.getString(1);
                return name;
            }

        } catch (SQLException ex) {

        }
        return null;
    }

    public ArrayList<User> getalluserBlog() {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "  SELECT distinct u.* FROM onlineshop.user u join blog b on u.user_id = b.author_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User s = new User(rs.getString(1), rs.getInt(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getInt(12), rs.getString(13));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<User> getalluserWithSearch(String search, String status, String gender, String roleID, String sort) {
        ArrayList<User> list = new ArrayList<>();
        try {
            List<Object> params = new ArrayList<>();
            StringBuilder sql = new StringBuilder();
            sql.append("  SELECT * FROM onlineshop.user where 1=1 ");
            if (status != null && !status.trim().isEmpty() && !status.equals("2")) {
                sql.append(" and `Status` = " + status + " ");
            }
            if (gender != null && !gender.trim().isEmpty() && !gender.equals("2")) {
                sql.append(" and `gender` = " + gender + "  ");
            }
            if (roleID != null && !roleID.trim().isEmpty() && !roleID.equals("0")) {
                sql.append(" and `role_id` = " + roleID + " ");
            }
            if (search != null && !search.trim().isEmpty()) {
                sql.append(" and (phone_number like '%" + search + "%' or email_address like '%" + search + "%' or fullname like '%" + search + "%' )");
            }
            if (sort != null && !sort.trim().isEmpty()) {
                sql.append(" order by " + sort);
            }
            System.out.println(sql.toString());
            PreparedStatement stm = connection.prepareStatement(sql.toString());
            DBHelper.mapParams(stm, params);
            ResultSet rs = stm.executeQuery();
            RoleDao roleDao = new RoleDao();
            while (rs.next()) {
                User s = new User(rs.getString(1), rs.getInt(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getInt(12), rs.getString(13));
                s.setRoleName(roleDao.getRoleById(s.getRole_id()));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }
//    public static void main(String[] args) {
//        UserDao ud = new UserDao();
//        List<User> l = ud.getalluserWithSearch("tuan", null,null,null,null);
//        System.out.println(l.size());
//    }

    public boolean changePass(String uid, String pass) {
        pass = password_encryption(pass);
        try {
            String sql = "UPDATE `onlineshop`.`user`\n"
                    + "SET `password` = '" + pass + "' WHERE `user_id` =" + uid;
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean activeAccount(String email, String key) {
        try {
            String sql = "UPDATE `onlineshop`.`user` SET `key_user` = null, `Status` = 1 \n"
                    + "WHERE `email_address` = '" + email + "' and `key_user` = '" + key + "'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String generateRandomString(int length) {
        Random random = new Random();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            sb.append(randomChar);
        }

        return sb.toString();
    }

    public ArrayList<User> getalluser() {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "  SELECT * FROM onlineshop.user ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User s = new User(rs.getString(1), rs.getInt(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getInt(12), rs.getString(13));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean resetPass(String email, long time) {
        try {
            String key = generateRandomString(10);
            SendMail.send(email, "ResetPassword", "Click the link below to resetpassword your account: <br> http://localhost:9999/ShoppingOnline/VerifyReset?email=" + email + "&key=" + key + "&time=" + time);

            String sql = "UPDATE `onlineshop`.`user` SET `key_user` = '" + key + "'"
                    + "WHERE `email_address` = '" + email + "'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public String password_encryption(String password) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UserRegister.class.getName()).log(Level.SEVERE, null, ex);
        }
        md.update(password.getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter
                .printHexBinary(digest).toUpperCase();
        //System.out.println("My Hash: " + myHash);
        return myHash;
    }

    public boolean changePassByEmail(String email, String pass) {
        pass = password_encryption(pass);
        try {
            String key = generateRandomString(15);
            String sql = "UPDATE `onlineshop`.`user`\n"
                    + "SET `password` = '" + pass + "' WHERE `email_address` ='" + email + "'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean verify(String inputPassword, String hashPassWord) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(inputPassword.getBytes());
            byte[] digest = md.digest();
            String myChecksum = DatatypeConverter
                    .printHexBinary(digest).toUpperCase();
            System.out.println(myChecksum);
            return hashPassWord.equals(myChecksum);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean update(String fullname, String gender, String phone, String address, String username, int uid) {
        try {
            String key = generateRandomString(15);
            String sql = "UPDATE `onlineshop`.`user` SET `fullname` = '" + fullname + "',"
                    + " `gender` = b'" + gender + "', `phone_number` = '" + phone + "', `address` = '" + address + "',"
                    + " `username` = '" + username + "' WHERE (`user_id` = '" + uid + "');";
            System.out.println(sql);
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public User getUserById(int uid) {
        try {
            String sql = "  SELECT * FROM onlineshop.user where user_id = " + uid;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User s = new User(rs.getString(1), rs.getInt(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getInt(12), rs.getString(13));
                return s;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean update(String fullname, String gender, String phone, String address, String username, int uid, String img) {
        try {
            String key = generateRandomString(15);
            String sql = "UPDATE `onlineshop`.`user` SET `fullname` = '" + fullname + "',"
                    + " `gender` = b'" + gender + "', `phone_number` = '" + phone + "', `address` = '" + address + "',`avartar` = '" + img + "',"
                    + " `username` = '" + username + "' WHERE (`user_id` = '" + uid + "');";
            System.out.println(sql);
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getUserByOrderID(String orderID) {
        try {
            String sql = "select a.* from user a join orders b on a.user_id=b.user_id where b.order_id = " + orderID + ";";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User s = new User(rs.getString(1), rs.getInt(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getInt(12), rs.getString(13));
                return s;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<User> GetAllSaler() {
        List<User> lu = new ArrayList<User>();
        try {
            String sql = "select * from User where role_id = 4;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User s = new User(rs.getString(1), rs.getInt(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getInt(12), rs.getString(13));
                lu.add(s);
            }
        } catch (Exception e) {
        }
        return lu;
    }
}
