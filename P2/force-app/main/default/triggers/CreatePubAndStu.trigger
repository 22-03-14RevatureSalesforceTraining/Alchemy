/*
* When an account gets created, create a Publisher record if the account is a Publisher record type.
* When an account gets created, create a Studio record if the account is a Studio record type.
*/

trigger CreatePubAndStu on Account (after insert) { 
    
    Set<String> pubAccountList = new Set<String>();
    Set<String> stuAccountList = new Set<String>();
    
    //separate the new account's names into separate lists for each record type
    for(Account a : Trigger.new){
        if(a.RecordTypeId == '0128b000000pN6FAAU'){//id for Publisher RT
            pubAccountList.add(a.Name);
        }
        else if(a.RecordTypeId == '0128b000000pN6KAAU'){ //id for Studio RT
            stuAccountList.add(a.Name);
        }
    }
    
    //get lists of existing publisher and studio records that have the same name as those in the lists
    List<Game_Publisher__c> existingPubList = [ SELECT Name FROM Game_Publisher__c WHERE Name IN :pubAccountList];
    List<Game_Studio__c> existingStuList = [ SELECT Name FROM Game_Studio__c WHERE Name IN :stuAccountList];
    
    if(existingPubList.size() != 0){
        //remove existing game publishers and studios from our pubAccountList and stuAccountList if they already exist
        for(Game_Publisher__c pubObj : existingPubList){
            if(pubAccountList.contains(pubObj.Name)){
                pubAccountList.remove(pubObj.Name);
            }
        }
    }
    
    if(existingStuList.size() != 0){
        for(Game_Studio__c pubObj : existingStuList){
            if(stuAccountList.contains(pubObj.Name)){
                stuAccountList.remove(pubObj.Name);
            }
        }
    }
    
    //create and populate the list to insert
    List<Game_Publisher__c> pubToInsertList = new List<Game_Publisher__c>();
    List<Game_Studio__c> stuToInsertList = new List<Game_Studio__c>();
    
    for(String pubName : pubAccountList){
        Game_Publisher__c pub = new Game_Publisher__c(Name = pubName);
        pubToInsertList.add(pub);
    }
    
    for(String stuName : stuAccountList){
        Game_Studio__c stu = new Game_Studio__c(Name = stuName);
        stuToInsertList.add(stu);
    }
    
    //perform the insert
    insert pubToInsertList;
    insert stuToInsertList;
}