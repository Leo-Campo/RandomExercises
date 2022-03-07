trigger OpportunityTrigger on Opportunity (before insert, before update) {
    if (Trigger.isInsert && Trigger.isBefore){
        List <Task> toInsert = new List<Task>();
        for (Opportunity current : Trigger.new){
            if (current.StageName == 'Closed Won' ){
                Task toAdd = new Task(Subject='Follow Up Test Task', WhatId=current.Id);
                toInsert.add(toAdd);
            }
        }
        insert toInsert;
    }

    if(Trigger.isUpdate && Trigger.isBefore){
        List <Task> toInsert = new List<Task>();
        for (Opportunity current : Trigger.new) {
            Opportunity oldCurrent = Trigger.oldMap.get(current.Id);
            if (current.StageName != old.StageName && current.StageName == 'Closed Won'){
                Task toAdd = new Task(Subject='Follow Up Test Task', WhatId=current.Id);
                toInsert.add(toAdd);
            }
        }
        insert toInsert;
    }
}