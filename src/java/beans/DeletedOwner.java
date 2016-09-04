package beans;

import java.io.Serializable;

public class DeletedOwner implements Serializable {

    private String ownerID;
    private String reason;
    private String deletionDate;
   
    //constructor
    public DeletedOwner() {
    }

    //setter methods
    public void setOwnerID(String newOwnerID) {
        this.ownerID = newOwnerID;
    }

    public void setReason(String newReason) {
        this.reason = newReason;
    }

    public void setDeletionDate(String newDeletionDate) {
        this.deletionDate = newDeletionDate;
    }


    //getter methods
    public String getOwnerID() {
        return ownerID;
    }

    public String getReason() {
        return reason;
    }

    public String getDeletionDate() {
        return deletionDate;
    }
}
