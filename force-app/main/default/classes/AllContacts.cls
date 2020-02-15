public class AllContacts {
    @AuraEnabled 
    public static List<Contact> getCons()
    {
        return [Select id,name,phone,email,Account.Name from Contact];
    }

}