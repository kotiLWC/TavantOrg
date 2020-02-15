public class AccWrapper {
    public List<AccWrappCls> lws{set;get;}
    public List<account> lstAcc{set;get;}
    public AccWrappCls ws{set;get;}
    public string name{set;get;}
    public string industry{set;get;}
    public Integer c{set;get;}

    
    public AccWrapper(){
        lws = new List<AccWrappCls>();
        lstAcc = new List<account>(); 
        lstAcc=[select name,industry,rating from account where rating='Hot' limit 10]; 
        for(integer i=0; i<lstAcc.size();i++){
         ws = new AccWrappCls();
            ws.acc = new account();
            ws.acc = lstAcc[i];
            ws.chckBx = false;
            lws.add(ws);
        }
    }
    
    public void add(){
        if(name != null && industry !=null){
       account a=new account();   
        a.name=name;    
        a.industry=industry;  
        a.rating='Hot';   
        insert a;
        }
    }
    public void edit(){
        for(integer k=0;k<lws.size();k++){
            if(lws[k].chckBx == true){
                name = lws[k].acc.name;
                industry = lws[k].acc.industry;
                c=k;
            }
            
        }
        
    }
    public void save(){
     lws[c].acc.name = name;
     lws[c].acc.industry = industry;
      update lws[c].acc;    
    }
    public void del(){
      list<account> temp=new list<account>();
       for(integer k=0;k<lws.size();k++){
            if(lws[k].chckBx == true){
             temp.add(lws[k].acc); 
                lws.remove(k);
                k--;
            }
       }
        delete temp;
    }
    
    public class AccWrappCls{
        public account acc{set;get;}
        public boolean chckBx{set;get;}
    }
    
}