public with sharing class BusGetter {

    public static BusModel getBusFields(Id busId){
        if(CRUDandFLSChecker.checkObject('read', 'Bus__c')&&
           CRUDandFLSChecker.checkFields('read', 'Bus__c', new List<String>{'Name', 'Picture__c', 'Capacity__c', 'Status__c'})
          ){
            List<Bus__c> buses = [Select Name, Picture__c, Capacity__c, Status__c from Bus__c where Id = :busID limit 1];
            BusModel bm;
            if(buses.size() > 0){
            bm = new BusModel(buses[0].Name, buses[0].Picture__c, buses[0].Capacity__c, buses[0].Status__c);
			}
            return bm;
        }
        else {
            throw new System.NoAccessException();
        }
    }    
}