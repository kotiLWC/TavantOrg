({
	handleClick : function(component, event, helper) {
		var acc = component.find('articleOne');
        for(var cmp in acc) {
        	$A.util.toggleClass(acc[cmp], 'slds-show');  
        	//$A.util.toggleClass(acc[cmp], 'slds-hide');  
       }
	}
})