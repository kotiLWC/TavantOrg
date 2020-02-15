({
    getAccounts : function(component, event, helper) {
        var action = component.get("c.getAccounts");
        action.setCallback(this,function(res){
        var state = res.getState();
            if(state == res.getState())
            {
             //console.log('List of Accounts::'res.getReturnValue())
             component.set("v.Accounts",res.getReturnValue());  
            }
        });
         $A.enqueueAction(action);    
        }
                           
})