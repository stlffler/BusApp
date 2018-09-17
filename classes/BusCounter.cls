public with sharing class BusCounter {

    public static Integer countAvailable(Id accountId){
        if(CRUDandFLSChecker.checkObject('read', 'Bus__c')&&
           CRUDandFLSChecker.checkFields('read', 'Bus__c', new List<String>{'Account__c', 'Status__c'})){
        	return [Select count() from Bus__c where (Account__c = :accountId and Status__c = 'Available')];
        }
        else{
            throw new insertException('You do not have a permission to access Buses');
        }
    }
    public static Integer countInUse(Id accountId){
        if(CRUDandFLSChecker.checkObject('read', 'Bus__c')&&
           CRUDandFLSChecker.checkFields('read', 'Bus__c', new List<String>{'Account__c', 'Status__c'})){
        	return [Select count() from Bus__c where (Account__c = :accountId and Status__c = 'In Use')];
        }
        else{
            throw new insertException('You do not have a permission to access Buses');
        }
    }
    
    @AuraEnabled
    public static Map<String, Integer> mapShow(Id accountId){
        Map<String, Integer> availabilityMap = new Map<String, Integer>();
        availabilityMap.put('available', countAvailable(accountId));
        availabilityMap.put('inuse', countInUse(accountId));
        return availabilityMap;
    }
}