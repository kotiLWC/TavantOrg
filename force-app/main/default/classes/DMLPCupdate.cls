public class DMLPCupdate {
    public List<account> lstAcc {set;get;}
    public list<selectoption> option {set;get;}   
    public string selected {set;get;} 
    public DMLPCupdate(){
        option = new list<selectoption>();
       lstAcc = new List<account>();
        lstAcc = [Select id,Name,rating,Phone,Industry,
                  (Select id,LastName,Phone,AccountId From Contacts) 
                  From Account 
                  WHERE Id IN (SELECT AccountId FROM Contact)];
          for(account a:lstAcc){     
           selectoption s=new selectoption(a.name,a.name);   
           option.add(s);         }   
    }
    public void change(){
      for(account a:lstAcc){ 
          if(a.Name == selected){
              for(Contact c:a.contacts){
                  c.Phone = a.Phone;
                  update c;
              }
          }
      }
    }

}