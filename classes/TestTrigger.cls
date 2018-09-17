@isTest
public class TestTrigger {
    
    public static testMethod void testTrigger() {
        BusLine__c bl = new BusLine__c (Bus__c = 'a011t000003lcnTAAQ', Line__c = 'a021t000003OZKRAA4');
        insert bl;
        BusLine__c bl2 = [Select Id from BusLine__c where (Bus__c = 'a011t000003lcnTAAQ' and Line__c = 'a021t000003OZKRAA4')];
        delete bl2;
    }
    

}