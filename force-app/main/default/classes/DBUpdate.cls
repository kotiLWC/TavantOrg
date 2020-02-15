public class DBUpdate {
    public List<account> lstAcc{set;get;}
    public list<id> successIds{set;get;}
    public list<String> errorFieldss{set;get;}
    public DBUpdate(){
        lstAcc = new List<account>();
        Account acc=[select name,phone from account where name='Koti' limit 1]; 
        successIds = new list<id>();
        errorFieldss = new list<String>(); 
        
        acc.Name = 'KotiJanu';
        acc.Phone ='657890';
        lstAcc.add(acc);
    }
    public void DBUpdate(){
        database.SaveResult[] ds= Database.update(lstAcc,false);
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