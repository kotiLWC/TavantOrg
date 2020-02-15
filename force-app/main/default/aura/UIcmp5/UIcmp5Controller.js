({
   init : function (component) {
      var action = component.get("c.getAccount");
      action.setCallback(this, function(response) {
         if (state === "SUCCESS") {
            component.set("v.account", response.getReturnValue());
            var flow = component.find("flowData");
            var inputVariables = [
               {
                  name : "account",
                  type : "SObject",
                  value: component.get("v.account")
               }
            ];

            flow.startFlow("myFlow", inputVariables);
         }
         else {
            console.log("Failed to get account date.");
         }
      });

      $A.enqueueAction(action);
   }
})