({
	doInit : function(component, event, helper) {
		var action = component.get("c.getCons");
         action.setCallback(this, function(a) {
             var records = a.getReturnValue();
             console.log("====records====>",records);
             component.set("v.allContacts", records);
         });
         $A.enqueueAction(action);
	},
})