    package beans;

import java.io.Serializable;

public class AdminMessage implements Serializable {

    private String adminMessageID;
    private String senderName;
    private String senderEmail;
    private String messageDate;
    private String message;
   
    //constructor
    public AdminMessage() {
    }

    //setter methods
    public void setAdminMessageID(String newAdminMessageID) {
        this.adminMessageID = newAdminMessageID;
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
    public String getAdminMessageID() {
        return adminMessageID;
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