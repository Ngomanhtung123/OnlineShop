/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Role;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author vieta
 */
public class RoleDao extends DBcontext {

    public String getRoleById(int id) {

        try {
            String sql = "select role_name from role where role_id=" + id + ";";
            Statement stm = connection.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                String role = rs.getString(1);
                return role;
            }
        } catch (SQLException ex) {
        }
        return null;
    }

    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM onlineshop.role";
            Statement stm = connection.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                list.add(new Role(rs.getInt(1), rs.getString(2)));
            }
            return list;
        } catch (SQLException ex) {
        }
        return null;
    }

    public int getNumberRole(String url) {
        int count = 0;
        try {
            String sql = "select * from userauthorization where URL like '" + url + "'";
            Statement stm = connection.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                count = count + 1;
            }
        } catch (Exception e) {
        }
        return count;
    }

    public boolean Haspermission(int role, String url) {
        url = url.substring(1);
        System.out.println(url);
        try {
            String sql = "select * from userauthorization where URL like '" + url + "'";
            int number = getNumberRole(url);
            Statement stm = connection.createStatement();
            if (number == 0) {
                return true;
            }
            ResultSet rs = stm.executeQuery(sql);
            if (number == 1) {
                while (rs.next()) {
                    int rOle = rs.getInt(1);
                    if (rOle == role) {
                        return true;
                    } else {
                        return false;
                    }
                }
            } else {
                while (rs.next()) {
                    int rOle = rs.getInt(1);
                    System.out.println(rOle);
                    if (rOle == role) {
                        return true;
                    }
                }
                return false;
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static void main(String[] args) {
        RoleDao rd = new RoleDao();
        int role = 5;
        String url = "/OrdersList";
        System.out.println(rd.Haspermission(role, url));
    }
}
