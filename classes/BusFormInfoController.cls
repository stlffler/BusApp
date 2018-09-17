public with sharing class BusFormInfoController {
	@AuraEnabled
    public static Map<String, List<Object>> getBusesAndLines(Id accountId){
        try{
            Map<String, List<Object>> BusesAndLinesMap= BusFormInfoGetter.getInfoForForm(accountId);
            return BusesAndLinesMap;
        }
        catch(NoAccessException e ){
            throw new AuraHandledException('You do not have a permission to see this element');
        }
    }
    
    @AuraEnabled
    public static void insertBusLine(Id busId, Id lineId){
        try	{
                BusFormChecker.insertBusLine(busId, lineId);
            }
        catch(insertException i){
                throw new AuraHandledException(i.getMessage());
            }
    }
}