/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author vieta
 */
public class User {
    String key_user;
    int user_id;
    String fullname;
    int gender;
    String phone_number;
    String email_address;
    String address;
    String username;
    String password ;
    String avartar;
    int role_id;
    int Status;
    String roleName;
    String create_date;

    public User() {
    }

    
    public User(String key_user, int user_id, String fullname, int gender, String phone_number, String email_address, String address, String username, String password, String avartar, int role_id, int Status, String create_date) {
        this.key_user = key_user;
        this.user_id = user_id;
        this.fullname = fullname;
        this.gender = gender;
        this.phone_number = phone_number;
        this.email_address = email_address;
        this.address = address;
        this.username = username;
        this.password = password;
        this.avartar = avartar;
        this.role_id = role_id;
        this.Status = Status;
        this.create_date = create_date;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
    
    public String getKey_user() {
        return key_user;
    }

    public void setKey_user(String key_user) {
        this.key_user = key_user;
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

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getEmail_address() {
        return email_address;
    }

    public void setEmail_address(String email_address) {
        this.email_address = email_address;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvartar() {
        return avartar;
    }

    public void setAvartar(String avartar) {
        this.avartar = avartar;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    @Override
    public String toString() {
        return "User{" + "key_user=" + key_user + ", user_id=" + user_id + ", fullname=" + fullname + ", gender=" + gender + ", phone_number=" + phone_number + ", email_address=" + email_address + ", address=" + address + ", username=" + username + ", password=" + password + ", avartar=" + avartar + ", role_id=" + role_id + ", Status=" + Status + ", create_date=" + create_date + '}';
    }
    
}
