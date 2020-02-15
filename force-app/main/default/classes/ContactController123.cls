public with sharing class ContactController123 {
    public Contact c { get; set; }
     public List<contact> lstUnLockAccount = new List<contact>();
     public List<contact> lstLockAccount = new List<contact>();

    public List<Contact> samepage { get; set; }
    public ContactController123(){
       c=new Contact();
    }
    public PageReference save() {
        system.debug('====c==='+c);
       insert c;  
      
        return null;
    }


   }