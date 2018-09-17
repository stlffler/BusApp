@isTest
public class TestBusCounter {
	
	public static testMethod void testRunAs() {

        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';

        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p.Id,
        TimeZoneSidKey='America/Los_Angeles',
        UserName=uniqueUserName);
		BusCounter.mapShow('0011t000004lDdEAAU');
 
        System.runAs(u) {
            try{
            BusCounter.mapShow('0011t000004lDdEAAU');
            }
            catch(insertException i1){
                try{
                	BusCounter.countAvailable('0011t000004lDdEAAU');
               	}
                catch(insertException i2){
                    BusCounter.countInUse('0011t000004lDdEAAU');
                }
            }
          }
    }
}