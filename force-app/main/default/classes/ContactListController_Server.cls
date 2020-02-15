public class ContactListController_Server {
    @AuraEnabled
    public static List<Contact> getContacts(String search){
        search = '%'+search+'%' ;
        List<Contact> lstCon = new List<Contact>();
        lstCon =[SELECT Name,Email,Phone,Account.Name FROM Contact WHERE Account.Name!= null AND Name LIKE :search LIMIT 1000];
        return lstCon;
    }

}