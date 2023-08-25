/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author vieta
 */
public class Order {
    int order_id;
    String order_date;
    int user_id;
    String fullname;
    String email;
    String mobile;
    String address;
    int status_order;
    String create_date;
    double totalCost;
    String firstProductName;
    String statusName;
    int gender;
    int sale_id;
    String Sale_Name;
    int numberProduct;
    public Order() {
    }

    public Order(int order_id, String order_date, int user_id, String fullname, String email, String mobile, String address, int status_order, String create_date) {
        this.order_id = order_id;
        this.order_date = order_date;
        this.user_id = user_id;
        this.fullname = fullname;
        this.email = email;
        this.mobile = mobile;
        this.address = address;
        this.status_order = status_order;
        this.create_date = create_date;
    }
    

    public int getNumberProduct() {
        return numberProduct;
    }

    public void setNumberProduct(int numberProduct) {
        this.numberProduct = numberProduct;
    }
    
    public String getSale_Name() {
        return Sale_Name;
    }

    public void setSale_Name(String Sale_Name) {
        this.Sale_Name = Sale_Name;
    }
    
    
    public int getSale_id() {
        return sale_id;
    }
    
    

    public void setSale_id(int sale_id) {
        this.sale_id = sale_id;
    }
    

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public String getFirstProductName() {
        return firstProductName;
    }

    public void setFirstProductName(String firstProductName) {
        this.firstProductName = firstProductName;
    }
    
    public void setStatusName(int status) {
        switch(status_order){
        case 1:
            statusName= "Pending";
            break;
        case 2:
            statusName= "Shipping";
            break;
        case 3:
            statusName= "Recived";
            break;
        case 4:
            statusName= "Canceled";
            break;
        default: statusName = "Unknown";
        }
    }
    
    public String getStatusName() {
        switch(status_order){
        case 1:
            return "Pending";
        case 2:
            return "Shipping";
        case 3:
            return "Recived";
        case 4:
            return "Canceled";
        }
        
        
        return statusName;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus_order() {
        return status_order;
    }

    public void setStatus_order(int status_order) {
        this.status_order = status_order;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }
    
    
}
