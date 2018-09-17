public with sharing class CRUDandFLSChecker {
    
	public static boolean checkObject(String mode, String objectName){
        boolean objectsSuccess=true;
        SObjectType schemaType = Schema.getGlobalDescribe().get(objectName);
        switch on mode{
            when 'create' {
                    if (!schemaType.getDescribe().IsCreateable()){
                        objectsSuccess=false;
                    }
                }
            when 'read' {                
                    if (!schemaType.getDescribe().IsAccessible()){
                        objectsSuccess=false;
                    }
                }
            when 'update' {
                    if (!schemaType.getDescribe().IsUpdateable()){
                        objectsSuccess=false;
                    }
                }
            when 'delete' {
                    if (!schemaType.getDescribe().IsDeletable()){
                        objectsSuccess=false;
                    }
                }
            }
        	
        return objectsSuccess;
        }
    
    public static boolean checkFields(String mode, String objectName, List<String> fieldNames){
		boolean fieldsSuccess = true;
        SObjectType schemaType = Schema.getGlobalDescribe().get(objectName);
        Map<String, SObjectField> fields = schemaType.getDescribe().fields.getMap();

        switch on mode{
            when 'create'{
                for (String fieldName : fieldNames){
                        DescribeFieldResult fieldDescribe = fields.get(fieldName).getDescribe();
                    	if (!fieldDescribe.isCreateable()){
                            {
                                fieldsSuccess = false;
                            }
                        }
                }
            }
            when 'read'{
                for (String fieldName : fieldNames){
                        DescribeFieldResult fieldDescribe = fields.get(fieldName).getDescribe();
                    	if (!fieldDescribe.IsAccessible()){
                            {
                                fieldsSuccess = false;
                            }
                        }
                }
            }
            when 'update'{
                for (String fieldName : fieldNames){
                        DescribeFieldResult fieldDescribe = fields.get(fieldName).getDescribe();
                    	if (!fieldDescribe.IsUpdateable()){
                            {
                                fieldsSuccess = false;
                            }
                        }
                }
            }
    	}
        return  fieldsSuccess;   
	}
}