/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author vieta
 */
public class Product {

    int product_id;
    String name_product;
    float original_prices;
    float sale_prices;
    int quantity;
    String category_name;
    String thumbnail;
    String brief_infor;
    String product_detail;
    String date_add;
    int product_Status;
    String create_date;
    String img_product;

    public Product() {
    }

    
    
    public Product(int product_id, String name_product, float original_prices, float sale_prices, int quantity, String category_name, String thumbnail, String brief_infor, String product_detail, String date_add, int product_Status, String create_date, String img_product) {
        this.product_id = product_id;
        this.name_product = name_product;
        this.original_prices = original_prices;
        this.sale_prices = sale_prices;
        this.quantity = quantity;
        this.category_name = category_name;
        this.thumbnail = thumbnail;
        this.brief_infor = brief_infor;
        this.product_detail = product_detail;
        this.date_add = date_add;
        this.product_Status = product_Status;
        this.create_date = create_date;
        this.img_product = img_product;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName_product() {
        return name_product;
    }

    public void setName_product(String name_product) {
        this.name_product = name_product;
    }

    public float getOriginal_prices() {
        return original_prices;
    }

    public void setOriginal_prices(float original_prices) {
        this.original_prices = original_prices;
    }

    public float getSale_prices() {
        return sale_prices;
    }

    public void setSale_prices(float sale_prices) {
        this.sale_prices = sale_prices;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getBrief_infor() {
        return brief_infor;
    }

    public void setBrief_infor(String brief_infor) {
        this.brief_infor = brief_infor;
    }

    public String getProduct_detail() {
        return product_detail;
    }

    public void setProduct_detail(String product_detail) {
        this.product_detail = product_detail;
    }

    public String getDate_add() {
        return date_add;
    }

    public void setDate_add(String date_add) {
        this.date_add = date_add;
    }

    public int getProduct_Status() {
        return product_Status;
    }

    public void setProduct_Status(int product_Status) {
        this.product_Status = product_Status;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getImg_product() {
        return img_product;
    }

    public void setImg_product(String img_product) {
        this.img_product = img_product;
    }
    
    
    
}
