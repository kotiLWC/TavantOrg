({
    handleClick : function(component, event, helper) {
        var selectedButtonLabel = event.getSource().get("v.label");
        if(selectedButtonLabel =="Download1")
        {
            component.set(component.get("v.attr1",true));
          //  component.set(component.get("v.attr2",false));
           // component.set(component.get("v.attr3",false));
            
        }
       
        //alert('Test=====>');	
    }
})