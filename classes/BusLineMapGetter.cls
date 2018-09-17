public with sharing class BusLineMapGetter {	
    
    public static Map<Id, List<LineModel>> getBusLineMap(Id accountID){
        if(CRUDandFLSChecker.checkObject('read', 'Bus__c')&&
           CRUDandFLSChecker.checkFields('read', 'Bus__c', new List<String>{'Id', 'Account__c'})&&
           CRUDandFLSChecker.checkObject('read', 'BusLine__c') &&
           CRUDandFLSChecker.checkFields('read', 'BusLine__c', new List<String>{'Line__c', 'Bus__c'}) &&
           CRUDandFLSChecker.checkObject('read', 'Line__c') &&
           CRUDandFLSChecker.checkFields('read', 'Line__c', new List<String>{'Id', 'Name', 'Start_Point__c', 'End_Point__c'})){
            Map<Id, List<LineModel>> BusLineMapGotByAccountId = new Map<Id, List<LineModel>>();
            List<BusModel> busList = new List<BusModel>();
            for (Bus__c bus : [SELECT Id  FROM Bus__c WHERE Account__c= :accountID]){
                busList.add(new BusModel(bus.Id));
			}
            for(BusModel bus : busList){
                List<LineModel> lineList = new List<LineModel>();
                List<BusLineModel> busLineList = new List<BusLineModel>();
                for(BusLine__c busLine :  [SELECT Line__c from BusLine__c where Bus__c = :bus.busId]){
                                                busLineList.add(new BusLineModel(busLine.Line__c));
                                            }
               List<id> lineIdList = new List<Id>();
               for(BusLineModel blm : busLineList){
                    lineIdList.add(blm.line);
               }
                for(Line__c line : [SELECT Id, Name, Start_Point__c, End_Point__c  from Line__c where Id in : lineIdList]){
                    lineList.add(new LineModel(line.Id, line.Name, line.Start_Point__c, line.End_Point__c));
                }
                BusLineMapGotByAccountId.put(bus.busId, lineList);
}
            return BusLineMapGotByAccountId;
        }
        else{
            throw new System.NoAccessException();
        }
    }
}