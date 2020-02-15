@isTest
private class TestRejectDoubleBooking{
    static testmethod void TestSingleBooking() {
        Datetime now = System.now();
        Speaker__c speaker = new Speaker__c(First_Name__c='John', Last_Name__c='Smith');
        insert speaker; 
        Session__c session = new Session__c(Name='Session', Session_Date__c=now);
        insert session;
        
        Session_Speaker__c assignment = new Session_Speaker__c(Speaker__c = speaker.id, Session__c = session.id); 
        Database.SaveResult result = Database.insert(assignment, false);
        
    }
    static testmethod void TestDoubleBooking() {
        Datetime now = System.now();
        Speaker__c speaker = new Speaker__c(First_Name__c='John', Last_Name__c='Smith');
        insert speaker; 
        Session__c session1 = new Session__c(Name='Session 1', Session_Date__c=now);
        insert session1;
        
        Session__c session2 = new Session__c(Name='Session 2', Session_Date__c=now);
        insert session2;
        
        Session_Speaker__c assignment1 = new Session_Speaker__c(Speaker__c = speaker.id, Session__c = session1.id); 
        Insert assignment1;
        
        Session_Speaker__c assignment2 = new Session_Speaker__c(Speaker__c = speaker.id, Session__c = session2.id); 
        Database.SaveResult result = Database.insert(assignment2, false);
    }
}