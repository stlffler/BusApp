@isTest
public class TestDeleteBusLineController {
	public static testMethod void testRunAs() {
        

        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';

        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p.Id,
        TimeZoneSidKey='America/Los_Angeles',
        UserName=uniqueUserName);
		
        DeleteBusLineController.removeBusLine('a011t000003lcnTAAQ', 'a021t000003OcWpAAK');
        
 
        System.runAs(u) {        
        	DeleteBusLineController.removeBusLine('a011t000003lcnTAAQ', 'a021t000003OcWpAAK');
        }
    }
}