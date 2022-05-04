public class BCThumbsUp {
    
    public void broadcastEvent(String prodName, Integer totThumbsUp, Integer rank){
            // Create an instance of the event and store it in the thumbsEvent variable
        NamsEvent__e thumbsEvent = new NamsEvent__e(
            Game_Name__c= prodName,
            Total_Thumbs_Up__c = totThumbsUp,
            Game_Rank__c = rank
        );
        
        // Call method to publish events
        Database.SaveResult sr = EventBus.publish(thumbsEvent);
        // Inspect publishing result
        if (sr.isSuccess()){
            System.debug('Successfully published event.');
        }
        else{
            for(Database.Error err : sr.getErrors()) {
                System.debug('Error returned: ' + err.getStatusCode() + ' - ' + err.getMessage());
            }
        }
    }
}