public class BusFormChecker {
	
    public static void insertBusLine(Id busId, Id lineId){
        if(CRUDandFLSChecker.checkObject('create', 'BusLine__c')){
            try{
                BusLine__c busl = new BusLine__c(Bus__c = busId , Line__c = lineId);
                insert busl;
                }
            catch(DmlException e){
                throw new insertException('This bus is already attached to this line');
            }
        }
        else{
                throw new insertException('You do not have a permission to insert this object');
            }
        }    
    
    /*public static void deleteBusLine(Id busId, Id lineId){
        if(CRUDandFLSChecker.checkObject('delete', 'BusLine__c')){
                List<BusLine__c> buslinelist = [Select Id from BusLine__c where Bus__C =:busId and Line__C =:lineId];
                delete buslinelist;
        }
        else{
            throw new insertException('You do not have a permission to delete this object');
        }
    }*/
}