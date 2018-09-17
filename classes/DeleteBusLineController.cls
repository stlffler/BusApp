public with sharing class DeleteBusLineController {
	
    @AuraEnabled
    public static void removeBusLine(Id busId, Id lineId){
        if(CRUDandFLSChecker.checkObject('read', 'BusLine__c') &&
           CRUDandFLSChecker.checkFields('read', 'BusLine__c', new List<String>{'Id', 'Bus__c', 'Line__c'}) &&
           CRUDandFLSChecker.checkObject('delete', 'BusLine__c')){
            List<BusLine__c> buslinelist = [Select Id from BusLine__c where (Bus__c = :busId and Line__c = :lineId)];
            delete buslinelist;
        }
        else {
            throw new AuraHandledException('You do not have a permission to remove Buses from Lines');
        }
    }
}