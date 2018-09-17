({
	doInit : function(component, event, helper) {
		var action = component.get("c.getBusesAndLines");
        action.setParams({
            accountId: component.get("v.recordId")            
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
				var infoMap = response.getReturnValue();                
                component.set("v.buses", infoMap['buses']);
                component.set("v.lines", infoMap['lines']);
            }
            else{
                component.set("v.err", false);
                var errors = response.getError();
                if (errors) {
                    err = true;
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
                    }
                } else {
                    alert("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
        
	},
    handleSaveClick: function(component, event, helper){
        var action = component.get("c.insertBusLine");
        action.setParams({
            busId: component.find("busList").get("v.value"),
            lineId: component.find("lineList").get("v.value")       
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title : 'Success Message',
                    message: 'The bus  is added',
                    messageTemplate: 'Record {0} created! See it {1}!',
                    duration:' 1000',
                    key: 'info_alt',
                    type: 'success',
                    mode: 'pester'
                });
                toastEvent.fire();
                var applicationEvent = $A.get("e.c:SomethingChanged");
                        applicationEvent.fire();
                /*var BusLineAdd = component.getEvent("BusLineAdded");
                BusLineAdd.fire(); */             
            } 
            else 
            {                
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
                    }
                } else {
                    alert("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
        
	},
    fireEvent: function(component, event, helper){
        
    }
    
})