package beans;

import java.io.Serializable;

public class Property implements Serializable {

    private String propertyID = "";
    private String ownerID = "";
    private String ownerFirstName = "";
    private String ownerLastName = "";
    private String adTitle = "";
    private String adPurpose = "";
    private String propertyType = "";
    private String propertySize = "";
    private String propertyPrice = "";
    private String propertyAddress = "";
    private String propertySuburb = "";
    private String propertyState = "";
    private String propertyPostcode = "";
    private String propertyBedrooms = "";
    private String propertyBathrooms = "";
    private String propertyCarSpaces = "";
    private String propertyDescription = "";
    private String adType = "";
    private String adStatus = "";
    private String dateCreated = "";
    private String expireDate = "";

    //constructor
    public Property() {
    }

    //setter methods
    public void setPropertyID(String newPropertyID) {
        this.propertyID = newPropertyID;
    }

    public void setOwnerID(String newOwnerID) {
        this.ownerID = newOwnerID;
    }

    public void setOwnerFirstName(String newOwnerFirstName) {
        this.ownerFirstName = newOwnerFirstName;
    }

    public void setOwnerLastName(String newOwnerLastName) {
        this.ownerLastName = newOwnerLastName;
    }

    public void setAdTitle(String newAdTitle) {
        this.adTitle = newAdTitle;
    }

    public void setAdPurpose(String newAdPurpose) {
        this.adPurpose = newAdPurpose;
    }

    public void setPropertyType(String newPropertyType) {
        this.propertyType = newPropertyType;
    }

    public void setPropertySize(String newPropertySize) {
        this.propertySize = newPropertySize;
    }

    public void setPropertyPrice(String newPropertyPrice) {
        this.propertyPrice = newPropertyPrice;
    }

    public void setPropertyAddress(String newPropertyAddress) {
        this.propertyAddress = newPropertyAddress;
    }

    public void setPropertySuburb(String newPropertySuburb) {
        this.propertySuburb = newPropertySuburb;
    }

    public void setPropertyState(String newPropertyState) {
        this.propertyState = newPropertyState;
    }

    public void setPropertyPostcode(String newPropertyPostcode) {
        this.propertyPostcode = newPropertyPostcode;
    }

    public void setPropertyBedrooms(String newPropertyBedrooms) {
        this.propertyBedrooms = newPropertyBedrooms;
    }

    public void setPropertyBathrooms(String newPropertyBathrooms) {
        this.propertyBathrooms = newPropertyBathrooms;
    }

    public void setPropertyCarSpaces(String newPropertyCarSpaces) {
        this.propertyCarSpaces = newPropertyCarSpaces;
    }

    public void setPropertyDescription(String newPropertyDescription) {
        this.propertyDescription = newPropertyDescription;
    }

    public void setAdType(String newFirstName) {
        this.adType = newFirstName;
    }

    public void setAdStatus(String newAdType) {
        this.adStatus = newAdType;
    }

    public void setDateCreated(String newDateCreated) {
        this.dateCreated = newDateCreated;
    }

    public void setExpireDate(String newExpireDate) {
        this.expireDate = newExpireDate;
    }

    //getter methods
    public String getPropertyID() {
        return propertyID;
    }

    public String getOwnerID() {
        return ownerID;
    }

    public String getOwnerFirstName() {
        return ownerFirstName;
    }

    public String getOwnerLastName() {
        return ownerLastName;
    }

    public String getAdTitle() {
        return adTitle;
    }

    public String getAdPurpose() {
        return adPurpose;
    }

    public String getPropertyType() {
        return propertyType;
    }

    public String getPropertySize() {
        return propertySize;
    }

    public String getPropertyPrice() {
        return propertyPrice;
    }

    public String getPropertyAddress() {
        return propertyAddress;
    }

    public String getPropertySuburb() {
        return propertySuburb;
    }

    public String getPropertyState() {
        return propertyState;
    }

    public String getPropertyPostcode() {
        return propertyPostcode;
    }

    public String getPropertyBedrooms() {
        return propertyBedrooms;
    }

    public String getPropertyBathrooms() {
        return propertyBathrooms;
    }

    public String getPropertyCarSpaces() {
        return propertyCarSpaces;
    }

    public String getPropertyDescription() {
        return propertyDescription;
    }

    public String getAdType() {
        return adType;
    }

    public String getAdStatus() {
        return adStatus;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public String getExpireDate() {
        return expireDate;
    }
}
