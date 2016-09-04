package beans;

import java.io.Serializable;

public class Comment implements Serializable {

    private String commentID;
    private String propertyID;
    private String customerName;
    private String customerEmail;
    private String commentDate;
    private String comment;
   
    //constructor
    public Comment() {
    }

    //setter methods
    public void setCommentID(String newCommentID) {
        this.commentID = newCommentID;
    }

    public void setPropertyID(String newPropertyID) {
        this.propertyID = newPropertyID;
    }

    public void setCustomerName(String newCustomerName) {
        this.customerName = newCustomerName;
    }

    public void setCustomerEmail(String newCustomerEmail) {
        this.customerEmail = newCustomerEmail;
    }

    public void setCommentDate(String newCommentDate) {
        this.commentDate = newCommentDate;
    }

    public void setComment(String newComment) {
        this.comment = newComment;
    }


    //getter methods
    public String getCommentID() {
        return commentID;
    }

    public String getPropertyID() {
        return propertyID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public String getCommentDate() {
        return commentDate;
    }

    public String getComment() {
        return comment;
    }
}