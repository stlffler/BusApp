public with sharing class BusLineModel {
	@AuraEnabled public Id bus;
    @AuraEnabled public Id line;
    @AuraEnabled public String lineName;
    @AuraEnabled public String lineStartPoint;
    @AuraEnabled public String lineEndPoint;
    @AuraEnabled public String busName;
    @AuraEnabled public Decimal busCapacity;
    @AuraEnabled public String busPicture;
    
    public BusLineModel(Id bus, Id line){
        this.bus = bus;
        this.line = line;
    }
    
    public BusLineModel(Id bus, Id line, String lineName, String lineStartPoint, String lineEndPoint, String busName, Decimal busCapacity, String busPicture){
        this.bus = bus;
        this.line = line;
        this.lineName = lineName;
        this.lineStartPoint = lineStartPoint;
		this.lineEndPoint = lineEndPoint;
        this.busName = busName;
        this.busCapacity = busCapacity;
        this.busPicture = busPicture;
    }
    
    public BusLineModel(Id line){
        this.line = line;
    }
        
}