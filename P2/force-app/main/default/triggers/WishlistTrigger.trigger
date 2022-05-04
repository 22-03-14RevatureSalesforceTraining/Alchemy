trigger WishlistTrigger on Wish_List_Item__c (after insert, after delete) {
    //Wish_List_Item__c wishItem = Trigger.old[0];//new Wish_List_Item__c();//
    //String email = wishItem.Customer.Email__c ;
    if(Trigger.isInsert){
        WishlistHelper.toMail = 'Snyder4000@yahoo.com';//
        WishlistHelper.sendAddedWish();
    }
    if(Trigger.isDelete){
        WishlistHelper.toMail = 'Snyder4000@yahoo.com';
        WishlistHelper.sendDeletedWish();
    }
}