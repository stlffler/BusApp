({
	Init : function(component, event, helper) {
		var action = component.get("c.mapShow");
        action.setParams({
            accountId: component.get("v.accountId")            
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {  
            	var available;
                var inuse;
                var availabilityMap = response.getReturnValue();
                available = availabilityMap['available'];
                inuse = availabilityMap['inuse'];
                component.set("v.availableNumber", available);
                component.set("v.unavailableNumber", inuse);
            }
            else{                
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            title : 'Error Message',
                            message: errors[0].message,
                            messageTemplate: 'Mode is pester ,duration is 5sec and Message is overrriden',
                            duration:' 1000',
                            key: 'info_alt',
                            type: 'error',
                            mode: 'pester'
                        });
                        toastEvent.fire();
                        component.set("v.err", false);
                    }
                } else {
                    console.log("Unknown error");
                }
                
            }
        });
        $A.enqueueAction(action);
	}
})