({
	onClick : function(component, event, helper) {
        debugger;
		//alert('=====Test======');
        var newAcc = component.get("v.newuser");
        alert(newAcc);
        var action = component.get("c.saveUser");
    	action.setParams({ 
        "acc": newAcc
   		 });
    	action.setCallback(this, function(a) {
           var state = a.getState();
            if (state === "SUCCESS") {
                var name = a.getReturnValue();
               alert("hello from here"+name);
            }
        });
    $A.enqueueAction(action)

	}
})