public class AccountsWithCheckBox {
    public boolean firstPanel{get;set;}
    public boolean secondPanel{get;set;}
    
    Public set<Id> IdsVal{set;get;}
    public list<account> accLST {set;get;}
    public list<account> SearchaccLST {set;get;}
    public list<accWrapperCls> lstWrap {set;get;}
    public string find{set;get;}
    public list<accWrapperCls> del {set;get;} 
    
    
    public AccountsWithCheckBox(){
        IdsVal = new set<Id>();
        firstPanel = true;
        secondPanel = false;
        lstWrap = new list<accWrapperCls>();
        del = new list<accWrapperCls>();
        accLST =new list<account>();
        accLST =[Select id,Name,Rating,industry From Account limit 10];
        for(Account a: accLST){
            accWrapperCls wrap = new accWrapperCls();
            wrap.Name = a.Name;
            wrap.Rating = a.Rating;
            wrap.Industry = a.Industry;
            wrap.IdVal = a.Id;
            wrap.selectCheck = false;
            lstWrap.add(wrap);  
        }
        
    }
    
    public class accWrapperCls{
        public string IdVal {set;get;}
        public string Name {set;get;}
        public string Rating {set;get;}
        public string Industry {set;get;}
        public boolean selectCheck {set;get;}
    }
    public void search(){
        firstPanel = false;
        secondPanel = true;
        system.debug('===Find===='+find);
        SearchaccLST =new list<account>();
        SearchaccLST =[Select id,Name,Rating,industry From Account where industry=:find AND industry != null];
    }
    public void DeleteRec(){
        for(integer k=0;k<lstWrap.size();k++){
            if(lstWrap[k].selectCheck == true){
               del.add(lstWrap[k]);
               IdsVal.add(lstWrap[k].IdVal);
               lstWrap.remove(k);
                k--;
            }
        }
        if(IdsVal.Size()>0)
        {
          system.debug('====Id===='+IdsVal);
            List<Account> delAcc = [Select id,Name From Account where id IN:IdsVal];
            for(Account a: delAcc){
             system.debug('====Name===='+a.Name);   
            }
            if(delAcc.size()>0){
              delete delAcc;  
            }
        }
    }
    
}