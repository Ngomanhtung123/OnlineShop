/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

        
package Dao;
import Model.Slider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 *
 * @author vieta
 */
public class SliderDao extends DBcontext{
    public List<Slider> getAllSlider(){
        List<Slider> list = new ArrayList<>();
        try {
            String sql = "select * from slider";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider sl = new Slider();
                sl.setSlider_id(rs.getInt(1));
                sl.setSlider_img(rs.getString(2));
                sl.setBacklink(rs.getString(3));
                sl.setStatus(rs.getInt(4));
                sl.setSlider_title(rs.getString(5));
                sl.setSlider_detail(rs.getString(6));
                sl.setUpdate_by(rs.getInt(7));
                sl.setCreate_date(rs.getString(8));
                list.add(sl);
            }   
        } catch (SQLException ex) {
            
        }
        return list;
    }
    public List<Slider> getAllSliderWithStatus(int status){
        List<Slider> list = new ArrayList<>();
        try {
            String sql = "select * from Slider where status = "+status+";";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider sl = new Slider();
                sl.setSlider_id(rs.getInt(1));
                sl.setSlider_img(rs.getString(2));
                sl.setBacklink(rs.getString(3));
                sl.setSlider_title(rs.getString(5));
                sl.setSlider_detail(rs.getString(6));
                list.add(sl);
            }   
        } catch (SQLException ex) {
            
        }
        return list;
    }
//    public static void main(String[] args) {
//            SliderDao d = new SliderDao();
//            System.out.println(d.getAllSliderWithStatus(1).get(0).getSlider_id());
//    }

    public List<Slider> getAllSliderWithSearchCondition(String status, String search) {
        List<Slider> list = new ArrayList<>();
        List<Object> listParams = new ArrayList<>();
        try {
            String sql = "select * from slider where 1=1";
            if (status != null && !status.trim().isEmpty()) {
                sql += " and status = ?";
                listParams.add(status);
            }
            if (search != null && !search.trim().isEmpty()) {
                sql += " and (slider_title like ? or backlink like ? )";
                listParams.add("%" + search + "%");
                listParams.add("%" + search + "%");
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            mapParams(stm,listParams);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider sl = new Slider();
                sl.setSlider_id(rs.getInt(1));
                sl.setSlider_img(rs.getString(2));
                sl.setBacklink(rs.getString(3));
                sl.setStatus(rs.getInt(4));
                sl.setSlider_title(rs.getString(5));
                sl.setSlider_detail(rs.getString(6));
                sl.setUpdate_by(rs.getInt(7));
                sl.setCreate_date(rs.getString(8));
                list.add(sl);
            }
        } catch (SQLException ex) {

        }
        return list;
    }

//    public List<Slider> getAllSliderWithStatus(int status) {
//        List<Slider> list = new ArrayList<>();
//        try {
//            String sql = "select * from Slider where status = " + status + ";";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Slider sl = new Slider();
//                sl.setSlider_id(rs.getInt(1));
//                sl.setSlider_img(rs.getString(2));
//                sl.setBacklink(rs.getString(3));
//                sl.setStatus(rs.getInt(4));
//                sl.setSlider_title(rs.getString(5));
//                sl.setSlider_detail(rs.getString(6));
//                sl.setUpdate_by(rs.getInt(7));
//                sl.setCreate_date(rs.getString(8));
//                list.add(sl);
//            }
//        } catch (SQLException ex) {
//
//        }
//        return list;
//    }

    public void mapParams(PreparedStatement ps, List<Object> args) throws SQLException {
        int i = 1;
        for (Object arg : args) {
            if (arg instanceof Date) {
                ps.setTimestamp(i++, new Timestamp(((Date) arg).getTime()));
            } else if (arg instanceof Integer) {
                ps.setInt(i++, (Integer) arg);
            } else if (arg instanceof Long) {
                ps.setLong(i++, (Long) arg);
            } else if (arg instanceof Double) {
                ps.setDouble(i++, (Double) arg);
            } else if (arg instanceof Float) {
                ps.setFloat(i++, (Float) arg);
            } else {
                ps.setString(i++, (String) arg);
            }
        }
    }
    
    public List<Slider> Paging(List<Slider> list,int pageNum,int size){
        if(list.isEmpty()){
            return list;
        }
        return list.subList((pageNum - 1) * size, Math.min(pageNum * size, list.size()));
    }

    public Slider getSliderById(int parseInt) {
        try {
            String sql = "select * from slider where slider_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, parseInt);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider sl = new Slider();
                sl.setSlider_id(rs.getInt(1));
                sl.setSlider_img(rs.getString(2));
                sl.setBacklink(rs.getString(3));
                sl.setStatus(rs.getInt(4));
                sl.setSlider_title(rs.getString(5));
                sl.setSlider_detail(rs.getString(6));
                sl.setUpdate_by(rs.getInt(7));
                sl.setCreate_date(rs.getString(8));
                return sl;
            }
        } catch (SQLException ex) {

        }
        return null;
    }

    public void updateStatus(int status, int parseInt , int uid) {
        try {
            String sql = "update slider set status = ? , update_by = "+uid+" where slider_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, parseInt);
            stm.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public void updateSlider(String id, String title, String backlink, String status, int uid) {
        try {
            String sql = "update slider set status = ? , backlink = ? , slider_title = ? , update_by = "+uid+" where slider_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(status));
            stm.setString(2, backlink);
            stm.setString(3, title);
            stm.setInt(4, Integer.parseInt(id));
            stm.executeUpdate();
        } catch (SQLException ex) {

        }
    }
}
