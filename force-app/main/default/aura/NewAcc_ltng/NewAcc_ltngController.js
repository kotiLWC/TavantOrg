({
    saveAccount : function(component, event, helper) {
        debugger;
        var accountRecord = component.get("v.accObj");
        if($A.util.isEmpty(accountRecord)){
            accountRecord.set("v.errors", [{message:"Input not valid: "}]);
        }
        console.log("====Account Record Details====",accountRecord);
        var action = component.get("c.createAccount");
        action.setParams({
            acc : accountRecord
        });
        action.setCallback(this,function(a){
            var state = a.getState();
            //check if result is successfull
            if(state == "SUCCESS"){
                //Reset Form
                var newAccount = {'sobjectType': 'Account',
                                  'Name': '',
                                  'Rating': 'Hot',
                                  'Phone': ''
                                 };
                component.set("v.accObj",newAccount);
                console.log('Inserted Account:::'+a.getReturnValue());
                component.set("v.AccDet", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        
    }
})