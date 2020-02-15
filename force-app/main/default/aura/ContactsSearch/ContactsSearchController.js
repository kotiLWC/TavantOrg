({
    search : function(component, event, helper) { 
        
        var txtVal = component.get("v.txtContact");
        var div1 = component.get("v.ValueOneisTrue");
        var div2 = component.get("v.ValueTwOisTrue");
        var action = component.get("c.getContacts");
        
        action.setParams({
            search : txtVal 
        });
        helper.showSpinner(component); 
        action.setCallback(this, function(a) {
            if (a.getState() === "SUCCESS") {
                helper.hideSpinner(component);
                var records = a.getReturnValue();
                component.set("v.rows", records);
                console.log("====Max Page====",Math.floor((records.length+9)/10));
                component.set("v.maxPage", Math.floor((records.length+9)/10));
                // component.set("v.ValueOneisTrue", !component.get("v.ValueOneisTrue"));
                component.set("v.ValueTwoisTrue", !component.get("v.ValueTwoisTrue"));
            } else if (a.getState() === "ERROR") {
                $A.log("Errors", a.getError());
            }
        });
        
        $A.enqueueAction(action);   
    },
     renderPage: function(component, event, helper) {
        helper.renderPage(component);
    },
})