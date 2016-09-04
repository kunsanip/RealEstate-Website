/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// Last edit 2015-05-01 by Sanip
package dbconfig;

import java.io.Serializable;

public class dbconfig implements Serializable {

    //--------localhost database config----------
    private final String db = "ssx";
    private final String dburl = "localhost";
    private final String dbuser = "root";
    private final String dbpassword = "root";

    //--------AWS database config--------
    //private final String db = "ssx-real-estate"; 
    //private final String dburl = "ssx.caclpzhk20ad.ap-southeast-2.rds.amazonaws.com"; 
    //private final String dbuser = "ssxrealestate"; 
    //private final String dbpassword = "ssxrealestate";
    //--------Database TABLES---------
    private final String dbadmin_messages = "admin_messages";
    //--------MYSQL---
    //  CREATE TABLE `ssx`.`admin_messages` (
    //  `admin_messageID` INT NOT NULL AUTO_INCREMENT,
    //  `contactName` VARCHAR(45) NOT NULL,
    //  `contactEmail` VARCHAR(45) NOT NULL,
    //  `messageSubject` VARCHAR(45) NOT NULL,
    //  `messageDate` DATETIME NOT NULL,
    //  `adminMessage` VARCHAR(200) NOT NULL,
    //   PRIMARY KEY (`admin_messageID`));
    //1.admin_messageID
    //2.contactName
    //3.contactEmail
    //4.messageSubject
    //5.messageDate
    //6.adminMessage
    private final String dbcomments = "comments";
    //1.commentID
    //2.propertyID
    //3.customerName
    //4.customerEmail
    //5.commentDate
    //6.comment
    private final String dbdeleted_owner = "deleted_owner";
    //1.owner_id
    //2.owner_FName
    //3.owner_Lname
    //4.reason
    private final String dbinspections = "inspections";
    //1.inspectionID
    //2.propertyID
    //3.ownerID
    //4.customerNme
    //5.customerEmail
    //6.inspectionDate
    //7.inspectionTime
    private final String dbownerMessages = "ownerMessages";
    //1.ownerMessageID
    //2.ownerID
    //3.senderName
    //4.senderEmail
    //5.messageDate
    //6.message
    private final String dbowners = "owners";
    //01.ownerID
    //02.password
    //03.firstName
    //04.lastName
    //05.email
    //06.phone
    //07.address
    //08.suburb
    //09.state
    //10.postcode
    //11.memberSince
    //12.picture
    private final String dbpremium = "premium";
    //-------MYSQL---
    //  CREATE TABLE `ssx`.`premium` (
    //  `premiumID` INT NOT NULL AUTO_INCREMENT,
    //  `propertyID` INT NOT NULL,
    //  `premiumType` VARCHAR(45) NOT NULL,
    //  `amountPaid` VARCHAR(45) NOT NULL,
    //  `premiumCreate` DATETIME NOT NULL,
    //  `premiumExpire` DATETIME NOT NULL,
    //  PRIMARY KEY (`premiumID`));
    //-------Column---
    //01.premiumID
    //02.propertyID
    //03.premiumType
    //04.amountPaid
    //05.premiumCreate
    //06.premiumExpire
    private final String dbproperties = "properties";
    //01.propertyID
    //02.ownerID
    //03.adTitle
    //04.adPurpose
    //05.propertyType
    //06.propertySize
    //07.propertyPrice
    //08.propertyAddress
    //09.propertyState
    //10.propertyPostcode
    //11.propertyBedrooms
    //12.propertyBathrooms
    //13.propertCarSpaces
    //14.propertyDescription
    //15.adType
    //16.dateCreated
    //17.propertyPicture

    //-------constructor------
    public dbconfig() {
    }

    //-------getter methods-------
    public String getdb() {
        return db;
    }

    public String getdburl() {
        return dburl;
    }

    public String getdbuser() {
        return dbuser;
    }

    public String getdbpassword() {
        return dbpassword;
    }

    public String TABLEadmin_messages() {
        return dbadmin_messages;
    }

    public String TABLEcomments() {
        return dbcomments;
    }

    public String TABLEdeleted_owner() {
        return dbdeleted_owner;
    }

    public String TABLEinspections() {
        return dbinspections;
    }

    public String TABLEownerMessages() {
        return dbownerMessages;
    }

    public String TABLEowners() {
        return dbowners;
    }

    public String TABLEpremium() {
        return dbpremium;
    }

    public String TABLEproperties() {
        return dbproperties;
    }

}
