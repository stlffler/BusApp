trigger changeBusAvailability on BusLine__c (before insert, after undelete, before delete) {
    if(trigger.isInsert || trigger.isUndelete){
       for (BusLine__c busline : Trigger.New)
       {
           List<BusLine__c> buslines = [Select Bus__c From BusLine__c where Id in: trigger.New];
           List<Id> idList = new List<Id>();
           for (BusLine__c buslineItem : buslines){
               idList.add(buslineItem.Bus__c);
           }
           List<Bus__c> buses = [Select Status__c from Bus__c where ID in :idList];
           for(Bus__c bus : buses)
           {
               bus.Status__c = 'In Use';
           }
           update buses;
       }
    }
    else{
                Set<Id> countId= new Set<id>();
                for (BusLine__c i : Trigger.old)
                {
                    countId.add(i.Bus__c);            
                }
            
            Integer count = [Select Count() from BusLine__c  where Bus__c in: countId];
            if (count == [Select Count() from BusLine__c where ID in : Trigger.Old])
            {
                Set<Id> ids= new Set<id>();
                for (BusLine__c i : Trigger.old)
                {
                    ids.add(i.Bus__c);            
                }
                List<Bus__c> buses = [Select Status__c From  Bus__c where Id in: ids];
                for (Bus__c bus : buses )
                {
                    bus.Status__c = 'Available';
                }
                update buses;

    }
}
}