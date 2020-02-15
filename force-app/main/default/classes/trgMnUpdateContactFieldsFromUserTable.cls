@isTest
private  class trgMnUpdateContactFieldsFromUserTable {
public static testMethod void testocc()
{
	List<Profile> PROFILE = [SELECT Id, Name FROM Profile WHERE Name='System administrator' LIMIT 1];
 String ProfId = PROFILE[0].id;
 User u = [Select Id,Name From User where profileId =:ProfId limit 1];
 system.runAs(u)
 {
	 Account acc = new Account(name = 'testaccount');
	 insert acc;
	 Contact con = new Contact(AccountId = acc.id, lastname = 'testdata' , firstname ='testdata1', OwnerId = Userinfo.getUserid() ,ConUserOwner__c = 'textdata');
	 insert con;
 }
}

}