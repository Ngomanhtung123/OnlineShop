/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author vieta
 */
public class Feedback {
    int feedback_id;
    String feedback_img;
    String feedback; 
    float rate_star;
    int product_id;
    int User_id;
    boolean feedback_status;
    String create_date;
    Product product;
    User user;
    public Feedback() {
    }

    public Feedback(int feedback_id, String feedback_img, String feedback, float rate_star, int product_id, int User_id, boolean feedback_status, String create_date) {
        this.feedback_id = feedback_id;
        this.feedback_img = feedback_img;
        this.feedback = feedback;
        this.rate_star = rate_star;
        this.product_id = product_id;
        this.User_id = User_id;
        this.feedback_status = feedback_status;
        this.create_date = create_date;
    }

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public String getFeedback_img() {
        return feedback_img;
    }

    public void setFeedback_img(String feedback_img) {
        this.feedback_img = feedback_img;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public float getRate_star() {
        return rate_star;
    }

    public void setRate_star(float rate_star) {
        this.rate_star = rate_star;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getUser_id() {
        return User_id;
    }

    public void setUser_id(int User_id) {
        this.User_id = User_id;
    }



    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean isFeedback_status() {
        return feedback_status;
    }

    public void setFeedback_status(boolean feedback_status) {
        this.feedback_status = feedback_status;
    }


    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }
    
    
}
