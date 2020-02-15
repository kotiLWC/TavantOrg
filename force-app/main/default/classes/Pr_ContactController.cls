public class Pr_ContactController {
    @AuraEnabled
    public static List<Contact> getContacts() {
        List<Contact> contacts = 
                [SELECT Id, Name, Phone, Email FROM Contact];
        //Add isAccessible() check
        return contacts;
}
}