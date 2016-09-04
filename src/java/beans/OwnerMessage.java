    package beans;

import java.io.Serializable;

public class OwnerMessage implements Serializable {

    private String ownerMessageID;
    private String ownerID;
    private String propertyID;
    private String senderName;
    private String senderEmail;
    private String messageDate;
    private String message;
   
    //constructor
    public OwnerMessage() {
    }

    //setter methods
    public void setOwnerMessageID(String newOwnerMessageID) {
        this.ownerMessageID = newOwnerMessageID;
    }

    public void setOwnerID(String newOwnerID) {
        this.ownerID = newOwnerID;
    }

    public void setPropertyID(String newPropertyID) {
        this.propertyID = newPropertyID;
    }

    public void setSenderName(String newSenderName) {
        this.senderName = newSenderName;
    }

    public void setSenderEmail(String newSenderEmail) {
        this.senderEmail = newSenderEmail;
    }

    public void setMessageDate(String newMessageDate) {
        this.messageDate = newMessageDate;
    }

    public void setMessage(String newMessage) {
        this.message = newMessage;
    }


    //getter methods
    public String getOwnerMessageID() {
        return ownerMessageID;
    }

    public String getOwnerID() {
        return ownerID;
    }

    public String getPropertyID() {
        return propertyID;
    }

    public String getSenderName() {
        return senderName;
    }

    public String getSenderEmail() {
        return senderEmail;
    }

    public String getMessageDate() {
        return messageDate;
    }

    public String getMessage() {
        return message;
    }
}