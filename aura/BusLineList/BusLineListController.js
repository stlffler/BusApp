({
	doInit : function(component, event, helper) {
        debugger;
		var action = component.get("c.showBusLineMap");
        action.setParams({
            accountId: component.get("v.recordId")            
        });
        action.setCallback(this, function(response){       
			var state = response.getState();
            if (state === "SUCCESS") {
                console.log(state);
                var buses = [];
                var busmap = response.getReturnValue();
                for(var key in busmap){
                    buses.push({value:busmap[key], key:key});
                }
                console.log(buses);
                component.set("v.buses", buses);
                console.log(component.get("v.buses"));
            }
            else {
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
            };
        });
        $A.enqueueAction(action);
    }
})