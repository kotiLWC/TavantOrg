public class OpportunityTriggHandler {
    
  //Insert Method
    public void befInsert(List<Opportunity> lstOpp)
    {
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Opportunity o : lstOpp){
            if(o.stageName == 'closed won')
            {
                Opportunity opp = new Opportunity();
                opp.AccountId = o.AccountId;
                opp.Name = o.Name + 'Insert';
                opp.stageName = 'Prospecting';
                opp.closedate = o.closedate;
                oppList.add(opp); 
            }
        }
        
        if(oppList.size()>0)
            insert oppList;
        system.debug('opplist===='+oppList);
    }
    
    //Update Method
    public void befUpdate(List<Opportunity> lstOpp)
    {
        Set<Id> AccId = new Set<id>();
        Set<Id> AccId1 = new Set<id>();
        Set<Id> OppId = new Set<id>();
        Set<Id> OppId1 = new Set<id>();
        
        List<Opportunity> oppList = new List<Opportunity>();
        for(Opportunity o : lstOpp){
            if(o.stageName == 'closed won'){
                AccId.add(o.AccountId);
                OppId.add(o.Id);
            }
            else
            {
                AccId1.add(o.AccountId);
                OppId1.add(o.Id);
                
            }
        }
        
        for(Opportunity op :[Select id,name,AccountId from Opportunity Where AccountId IN:AccId1 AND id IN:OppId1])
        {
            trigger.new[0].addError('opportunity cannot be closed Won');
        }   
        
        for(Opportunity op :[Select id,name,AccountId from Opportunity Where AccountId IN:AccId AND id IN:OppId])
        {
            Opportunity o1 = new Opportunity();
            o1.AccountId = op.AccountId;
            o1.Name = op.name + 'Update';
            o1.CloseDate = System.today();
            o1.StageName = 'Prospecting';
            oppList.add(o1);
        }
        Insert oppList;
        
    } 
}