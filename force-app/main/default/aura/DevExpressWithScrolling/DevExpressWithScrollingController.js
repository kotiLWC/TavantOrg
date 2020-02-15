({
	scriptsLoaded : function(component, event, helper) {
		debugger;
		//		alert('Test');
		var action = component.get("c.getAccountsData");
		action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               component.set('v.ListOfAccounts',response.getReturnValue());
				//alert("From server: " + response.getReturnValue());
				helper.accountTableHelper(component,component.get('v.ListOfAccounts'));
             
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });

		$A.enqueueAction(action);

	}
})