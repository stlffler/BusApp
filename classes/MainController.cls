public with sharing class MainController {
    
    @AuraEnabled
    public static Map<Id, List<LineModel>> showBusLineMap(Id accountId){
       try
       {
           Map<Id, List<LineModel>> blm  = BusLineMapGetter.getBusLineMap(accountID);
           return blm;
       }
       catch(NoAccessException e){
            throw new AuraHandledException('You do not have a permission to interact with Buses. Please contact your System Administrator if you need it');
       }
    }

}