({
	Init : function(component, event, helper) {
        
        var action = component.get("c.busShow");
        action.setParams({
            busId: component.get("v.busId")            
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {                
                var bus = response.getReturnValue();
                component.set("v.bus", bus);
            } 
            else {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        component.set("v.errmessage", errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    }
})