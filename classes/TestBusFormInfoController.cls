@isTest
public class TestBusFormInfoController {
	public static testMethod void testRunAs() {
        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';

        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p.Id,
        TimeZoneSidKey='America/Los_Angeles',
        UserName=uniqueUserName);
        
        BusFormInfoController.getBusesAndLines('0011t000004lDdEAAU');
        
        
         
        System.runAs(u) {
            try{
            BusFormInfoController.getBusesAndLines('0011t000004lDdEAAU');
            }
            catch(Exception e1){
                try {
                    BusFormInfoController.insertBusLine('a011t000003lcnTAAQ', 'a021t000003OcWpAAK');
                }
                catch(Exception e2){
                    BusFormInfoController.insertBusLine('a011t000003lo68AAA', 'a021t000003OZKRAA4');
                }
            }
            
            
        }
        
    }
    
    public static testMethod void testInsert(){
        BusFormInfoController.insertBusLine('a011t000003lcnTAAQ', 'a021t000003OcWpAAK');
    }
}