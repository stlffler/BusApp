public with sharing class BusFormInfoGetter {
	
    public static Map<String, List<Object>> getInfoForForm(Id accountId){
        if(CRUDandFLSChecker.checkObject('read', 'Bus__c') &&
           CRUDandFLSChecker.checkObject('read', 'Line__c') &&
           CRUDandFLSChecker.checkFields('read', 'Bus__c', new List<String>{'Id', 'Name', 'Account__c'})&&
           CRUDandFLSChecker.checkFields('read', 'Line__c', new List<String>{'Id', 'Name'}))
        {
            Map<String, List<Object>> infoForForm = new Map<String, List<Object>>();
            List<BusModel> busList = new List<BusModel>();
            List<LineModel> lineList = new List<LineModel>();
            for(Bus__c bus : [Select Id, Name from Bus__c where Account__c= :accountId order by Name]){
                busList.add(new BusModel(bus.Id, bus.Name));
            }
            for(Line__c line : [Select Id, Name from Line__c order by Name]){
                lineList.add(new LineModel(line.Id, line.Name));
            }
            infoForForm.put('buses', busList);
            infoForForm.put('lines', lineList);
            return infoForForm;
        }
        else{
            throw new System.NoAccessException();
        }
    }
    
}