@isTest
public class TestMainController {
	public static testMethod void testRunAs() {
        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';

        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p.Id,
        TimeZoneSidKey='America/Los_Angeles',
        UserName=uniqueUserName);
        
        MainController.showBusLineMap('0011t000004lDdEAAU');
        
         
        System.runAs(u) {
            try{
            MainController.showBusLineMap('0011t000004lDdEAAU');
            }
            catch(AuraHandledException e){
                System.debug(e.getMessage());
            }
        }
        
    }
}