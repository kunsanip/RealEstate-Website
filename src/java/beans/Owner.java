package beans;

import java.io.Serializable;

public class Owner implements Serializable {

    private String ownerID;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String address;
    private String suburb;
    private String state;
    private String postcode;
    private String memberSince;
    private String totalProperties;
   
    //constructor
    public Owner() {
    }

    //setter methods
    public void setOwnerID(String newOwnerID) {
        this.ownerID = newOwnerID;
    }

    public void setPassword(String newPassword) {
        this.password = newPassword;
    }

    public void setFirstName(String newFirstName) {
        this.firstName = newFirstName;
    }

    public void setLastName(String newLastName) {
        this.lastName = newLastName;
    }

    public void setEmail(String newEmail) {
        this.email = newEmail;
    }

    public void setPhone(String newPhone) {
        this.phone = newPhone;
    }

    public void setAddress(String newAddress) {
        this.address = newAddress;
    }

    public void setSuburb(String newSuburb) {
        this.suburb = newSuburb;
    }

    public void setState(String newState) {
        this.state = newState;
    }

    public void setPostcode(String newPostcode) {
        this.postcode = newPostcode;
    }

    public void setMemberSince(String newMemberSince) {
        this.memberSince = newMemberSince;
    }

    public void setTotalProperties(String newTotalProperties) {
        this.totalProperties = newTotalProperties;
    }

    //getter methods
    public String getOwnerID() {
        return ownerID;
    }

    public String getPassword() {
        return password;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getSuburb() {
        return suburb;
    }

    public String getState() {
        return state;
    }

    public String getPostcode() {
        return postcode;
    }

    public String getMemberSince() {
        return memberSince;
    }

    public String getTotalProperties() {
        return totalProperties;
    }
}
