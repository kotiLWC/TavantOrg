({
    getData : function(component, event, methodName, targetAttribute) 
    {
        var action = component.get('c.'+methodName);
        action.setCallback(this, $A.getCallback(function (response) {
            
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('Got Raw Response for ' + methodName + ' ' + targetAttribute);
                console.log(response.getReturnValue());
                
                var flattenedObject = this.flattenQueryResult(response.getReturnValue());
                
                component.set('v.'+targetAttribute, flattenedObject);
                
                console.log(flattenedObject);
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },
    
    flattenObject : function(propName, obj)
    {
        var flatObject = [];
        
        for(var prop in obj)
        {
            //if this property is an object, we need to flatten again
            var propIsNumber = isNaN(propName);
            var preAppend = propIsNumber ? propName+'_' : '';
            if(typeof obj[prop] == 'object')
            {
                flatObject[preAppend+prop] = Object.assign(flatObject, this.flattenObject(preAppend+prop,obj[prop]) );
                
            }    
            else
            {
                flatObject[preAppend+prop] = obj[prop];
            }
        }
        return flatObject;
    },
    
    flattenQueryResult : function(listOfObjects) {
        if(typeof listOfObjects != 'Array') 
        {
            var listOfObjects = [listOfObjects];
        }
        
        console.log('List of Objects is now....');
        console.log(listOfObjects);
        for(var i = 0; i < listOfObjects.length; i++)
        {
            var obj = listOfObjects[i];
            for(var prop in obj)
            {      
                if(!obj.hasOwnProperty(prop)) continue;
                if(typeof obj[prop] == 'object' && typeof obj[prop] != 'Array')
                {
                    obj = Object.assign(obj, this.flattenObject(prop,obj[prop]));
                }
                else if(typeof obj[prop] == 'Array')
                {
                    for(var j = 0; j < obj[prop].length; j++)
                    {
                        obj[prop+'_'+j] = Object.assign(obj,this.flattenObject(prop,obj[prop]));
                    }
                }
            }
        }
        return listOfObjects;
    },
    
})