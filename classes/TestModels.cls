@isTest
public class TestModels {	
    
    public static testMethod void testRunAs() {
        
        BusModel bm = new BusModel ('name', 'picture', 7, 'status', '0011t000004lDdEAAU', '0011t000004lDdEAAU', 7);
        BusModel bm2 = new BusModel('0011t000004lDdEAAU');
        BusModel bm3 = new BusModel('name', 'picture', 7, 'status');
        BusModel bm4 = new BusModel('0011t000004lDdEAAU', 'name');
        
        LineModel lm =  new  LineModel('0011t000004lDdEAAU', 'name', 'start_point', 'end_point');
        LineModel lm2 =  new  LineModel('0011t000004lDdEAAU', 'name');
        System.assert(bm.name == 'name');
    }
}