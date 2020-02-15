public class DBInsert {
    public List<account> lstAcc{set;get;}
    public list<id> successIds{set;get;}
    public list<String> errorFieldss{set;get;}
    public DBInsert(){
        lstAcc = new List<account>();
        successIds = new list<id>();
        errorFieldss = new list<String>(); 
        account a=new account();
        a.Name = 'Koti';
        a.Industry ='Engineering';
        lstAcc.add(a);
        account a1=new account();
        a1.Name = 'Janu';
        a1.Industry ='Engineering';
        lstAcc.add(a1);
        account a2=new account();
        a2.Industry ='Engineering';
        lstAcc.add(a2);
    }
    public void DBInsert(){
       database.SaveResult[] ds= Database.insert(lstAcc,false);
         for(database.saveresult sr:ds){
               if(sr.issuccess()){ 
                   successIds.add(sr.getid());
               }
             else{
               database.error[] de=sr.getErrors();
                 for(database.error ed: de){
                      apexpages.message msg=new apexpages.message(apexpages.Severity.ERROR,'Message'+ed.getmessage());  
                     apexpages.addMessage(msg); 
                     apexpages.message msg1=new apexpages.message(apexpages.Severity.ERROR,'Code'+ed.getstatuscode()); 
                     apexpages.addMessage(msg1);   
                     apexpages.message msg2=new apexpages.message(apexpages.Severity.ERROR,'Error Fields'+ed.getfields()); 
                     apexpages.addMessage(msg2);
                     //errorFieldss.add(ed.getfields());
                 }
             }
         }
    }

}