public with sharing class BusModel {
	@AuraEnabled public String name {get; set;}
    @AuraEnabled public String picture {get; set;}
    @AuraEnabled public Decimal capacity {get; set;}
    @AuraEnabled public String status {get; set;}
    @AuraEnabled public Id accountId {get; set;}
    @AuraEnabled public Id busId {get; set;}
    @AuraEnabled public Integer counter {get; set;}
    
    public BusModel (String name, String picture, Decimal capacity, String status, Id accountID, Id busId, Integer counter) {
        this.name = name;
        this.picture = picture;
        this.capacity = capacity;
        this.status = status;
        this.accountID = accountID;
        this.busId = busId;
        this.counter = counter;
    }
    
    public BusModel(Id busID){
	 	this.busID = busID;
    }
    
    public BusModel(String name, String picture, Decimal capacity, String status){
	 	this.name = name;
        this.picture = picture;
        this.capacity = capacity;
        this.status = status;
    }
    
    public BusModel(Id busID, String name){
	 	this.busID = busID;
        this.name = name;
    }
}