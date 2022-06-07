/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.user;

import java.sql.Date;

/**
 *
 * @author Xqy
 */
public class DoctorDTO extends UserDTO{
    private String categoryID; 

    public DoctorDTO() {
    }

    public DoctorDTO(String categoryID, String userID, String password, String fullName, String roleID, String gender, String address, String image, Date birthday, String email, String phone, boolean status) {
        super(userID, password, fullName, roleID, gender, address, image, birthday, email, phone, status);
        this.categoryID = categoryID;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

}
