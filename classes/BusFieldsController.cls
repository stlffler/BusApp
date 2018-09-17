public class BusFieldsController {
	@AuraEnabled
    public static BusModel busShow(Id busId){
        try{
            BusModel bm = BusGetter.getBusFields(busId);
            return bm;
        }
        catch(NoAccessException e) {
            throw new AuraHandledException('You do not have a permission to see this component');
        }
    }
}