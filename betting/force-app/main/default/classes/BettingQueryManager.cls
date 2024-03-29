public with sharing class BettingQueryManager {
    public static Boolean checkIfRelatedOppExists(String Name){
        Boolean isOpportunityExists;
        try {
            Opportunity betOpportunity = [SELECT Id,Name FROM Opportunity WHERE Name=:Name LIMIT 1];
            isOpportunityExists = true;
        } catch (System.QueryException e) {
            isOpportunityExists = false;
        }
        return isOpportunityExists;
    }

    public static Lead getLeadPlayer (Id playerId){
        try{
            return [SELECT Id,LastName,Players_Fund__c FROM Lead WHERE Id=:playerId LIMIT 1];
        } catch(System.QueryException e){
            return null;
        }
    }
    public static Contact getContactPlayer (Id playerId){
        try{
            return [SELECT Id,Name,Players_Fund__c FROM Contact WHERE Id=:playerId LIMIT 1];
        } catch(System.QueryException e){
            return null;
        }
    }
    public static Product2 getBetEvent (Id matchId){
        try{
            return [SELECT Id, Name, Multiplier__c,Event_Date__c FROM Product2 WHERE Id =:matchId LIMIT 1];
        } catch(System.QueryException e){
            return null;
        }
    }
    public static List<Bet_Unit__c> getExistingUnits (Id opportunityId){
        try{
            return [SELECT Name FROM Bet_Unit__c WHERE Opportunity__c =: opportunityId];
        } catch(System.QueryException e){
            return null;
        }
    }
    public static Opportunity getExistingOpportunity (String Name){
        try {
            return [SELECT Id,Name,Bet_Time__c,CloseDate,StageName,
            Players_Fund_After_Bet__c,Players_Fund_Before_Bet__c 
            FROM Opportunity
            WHERE Name=:Name 
            LIMIT 1];
        } catch(System.QueryException e){
            return null;
        }
    }
}
