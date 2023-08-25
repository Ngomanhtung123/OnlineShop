/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author vieta
 */
public class DBcontext {
    protected Connection connection;

    public DBcontext() {
        try {
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/";
            String username = "root";
            String password = "12345678";//mat khau cua ban
            String dbName = "onlineshop";//ten csdl ma ban can ket noi
            Class.forName(driver).newInstance();
            connection = DriverManager.getConnection(url + dbName, username, password);
            //System.out.println("Kết nối thành công");
        } catch (Exception ex) {
            //System.err.println("Không kết nối được với csdl");
        }
    }
}
