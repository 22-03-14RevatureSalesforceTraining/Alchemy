public class WishlistHelper {
    public static string toMail { get; set;}
    public static void sendAddedWish(){
        // If we know how many addresses the email will be sent to from this transaction
       	// We can set the reserve capacity
        Messaging.reserveSingleEmailCapacity(2);
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        string[] to = new string[] {toMail};
        email.setToAddresses(to);
        email.setSubject('Item Added To Wish List');
        email.setHtmlBody('Hello, <br/><br/>You have added an item to your wishlist. <br/>Regards<br/> Developer');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
    }
    public static void sendDeletedWish(){
        // If we know how many addresses the email will be sent to from this transaction
        // We can set the reserve capacity
        Messaging.reserveSingleEmailCapacity(2);
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        string[] to = new string[] {toMail};
        email.setToAddresses(to);
        email.setSubject('Item Removed From Wish List');
        email.setHtmlBody('Hello, <br/><br/>You have removed an item from your wishlist.<br/>Regards<br/> Developer');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
    }
}