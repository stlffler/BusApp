@isTest
public class TestBusFieldsController {
	public static testMethod void testRunAs() {

        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';

        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p.Id,
        TimeZoneSidKey='America/Los_Angeles',
        UserName=uniqueUserName);
		BusFieldsController.busShow('a011t000003lcnTAAQ');
 
        System.runAs(u) {
            try{
                BusFieldsController.busShow('a011t000003lcnTAAQ');
            }
            catch(AuraHandledException e1 ){
                System.debug(e1.getMessage());
            }
          }
    }
}