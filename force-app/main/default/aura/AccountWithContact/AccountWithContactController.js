({
doInit : function(component, event, helper) {
var action = component.get("c.getAccount");
action.setCallback(this, function(response) {
var state = response.getState();
if(state === "SUCCESS") {
	console.log('List Of Accounts::'+response.getReturnValue());
component.set("v.account", response.getReturnValue());
} else {
console.log('Problem getting account, response state: ' + state);
}
});
$A.enqueueAction(action);

}
})