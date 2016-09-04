package beans;

import java.io.Serializable;

public class Inspection implements Serializable {

    private String inspectionID;
    private String propertyID;
    private String ownerID;
    private String customerName;
    private String customerEmail;
    private String inspectionDate;
    private String inspectionTime;
    private String comment;
   
    //constructor
    public Inspection() {
    }

    //setter methods
    public void setInspectionID(String newInspectionID) {
        this.inspectionID = newInspectionID;
    }

    public void setPropertyID(String newPropertyID) {
        this.propertyID = newPropertyID;
    }

    public void setOwnerID(String newOwnerID) {
        this.ownerID = newOwnerID;
    }

    public void setCustomerName(String newCustomerName) {
        this.customerName = newCustomerName;
    }

    public void setCustomerEmail(String newCustomerEmail) {
        this.customerEmail = newCustomerEmail;
    }

    public void setInspectionDate(String newInspectionDate) {
        this.inspectionDate = newInspectionDate;
    }

    public void setInspectionTime(String newInspectionTime) {
        this.inspectionTime = newInspectionTime;
    }

    public void setComment(String newInspection) {
        this.comment = newInspection;
    }


    //getter methods
    public String getInspectionID() {
        return inspectionID;
    }

    public String getPropertyID() {
        return propertyID;
    }

    public String getOwnerID() {
        return ownerID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public String getInspectionDate() {
        return inspectionDate;
    }

    public String getInspectionTime() {
        return inspectionTime;
    }

    public String getComment() {
        return comment;
    }
}