trigger leadTrigger on Lead (before insert,after insert,before update,after update) {
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            for(Lead l:Trigger.New){
                if(String.isBlank(l.LeadSource)){
                    l.LeadSource='Other';
                }
                if(String.isBlank(l.Industry) ){
                    l.addError('please enter the industry field');
                }
            }
        }
        when AFTER_INSERT{
                for(Lead l:Trigger.New){
                    Task leadtask =new Task(Subject='Follow up the Leadtask',WhoId=l.ID);
                    insert leadtask;
                        }
            }
        when BEFORE_UPDATE{
            for(Lead l:Trigger.New){
                if(String.isBlank(l.LeadSource)){
                    l.LeadSource='Other';
                }
                if((l.Status=='Closed - Converted' || l.Status=='Closed - Not Converted') && trigger.oldMap.get(l.Id).Status=='Open - Not Contacted'){
                    l.Status.addError('can not change field from open to close');
                }
            }
        }
        
    }
    
    
}