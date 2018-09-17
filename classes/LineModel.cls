public with sharing class LineModel {
	@AuraEnabled public String name {get; set;}
    @AuraEnabled public String start_point {get; set;}
    @AuraEnabled public String end_point {get; set;}
    @AuraEnabled public Id lineId {get; set;}
    
    
    public LineModel (Id lineId, String name, String start_point, String end_point){
        this.name = name;
        this.start_point = start_point;
        this.end_point = end_point;
        this.lineId = lineId;
    }
    
    public LineModel(Id lineId, String name){
        this.lineId = lineId;
        this.name = name;
    }
    
}