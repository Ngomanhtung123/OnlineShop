/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author vieta
 */
public class OrderDetail {
    int order_detailID;
    float prices;
    int quantity;
    int order_id;
    int product_id;
    String create_date;
    Product product;
    int Feedback_Status;
    
    public OrderDetail() {
    }

    public OrderDetail(int order_detailID, float prices, int quantity, int order_id, int product_id, String create_date) {
        this.order_detailID = order_detailID;
        this.prices = prices;
        this.quantity = quantity;
        this.order_id = order_id;
        this.product_id = product_id;
        this.create_date = create_date;
    }

    public int getFeedback_Status() {
        return Feedback_Status;
    }

    public void setFeedback_Status(int Feedback_Status) {
        this.Feedback_Status = Feedback_Status;
    }
    
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    

    public int getOrder_detailID() {
        return order_detailID;
    }

    public void setOrder_detailID(int order_detailID) {
        this.order_detailID = order_detailID;
    }

    public float getPrices() {
        return prices;
    }

    public void setPrices(float prices) {
        this.prices = prices;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }
}
