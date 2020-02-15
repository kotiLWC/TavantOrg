Trigger OpportunityTrigg on opportunity(Before update, Before Insert){
    OpportunityTriggHandler obj = new OpportunityTriggHandler();
    //Calling Insert Method
    if(trigger.IsInsert && trigger.IsBefore)
    {
        obj.befInsert(trigger.new);
    }
    
    //Calling Update Method
    else if(trigger.IsUpdate && trigger.IsBefore)
    {
        obj.befUpdate(trigger.new);
    }
    
}