({
		deleteBusLine: function(component, event, helper){
            console.log(component.get("v.line"));
            debugger;
            var action = component.get("c.removeBusLine");
            action.setParams({
            	busId: component.get("v.busId"),
                lineId: component.get("v.line.lineId")
        	});
            action.setCallback(this, function(response){
                var state = response.getState();
            	if (state === "SUCCESS") {
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Success Message',
                        message: 'The Bus was removed from the line',
                        messageTemplate: 'Record {0} created! See it {1}!',
                        duration:' 5000',
                        key: 'info_alt',
                        type: 'success',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                    var applicationEvent = $A.get("e.c:SomethingChanged");
                        applicationEvent.fire();

                    //var busLineDelete = component.getEvent("busLineDelete");
            		//busLineDelete.fire();
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
                                duration:' 5000',
                                key: 'info_alt',
                                type: 'error',
                                mode: 'pester'
                            });
                            toastEvent.fire();
                        }
                	} else {
                    	console.log("Unknown error");
                	}
                }
            });
            $A.enqueueAction(action);
         }
})