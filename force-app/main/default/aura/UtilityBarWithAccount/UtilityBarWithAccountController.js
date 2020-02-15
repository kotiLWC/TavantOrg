({
	doInit : function(cmp, event, helper) {
		var action = cmp.get("c.getAccounts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.accountList", response.getReturnValue());
            }
        });
         $A.enqueueAction(action);
	}
})