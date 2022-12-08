trigger CheckActiveTrigger on Contact (after insert,after update,after delete,after undelete) {
    switch on Trigger.operationType{
        when AFTER_INSERT{
            ActivecheckContact.afterInsert(Trigger.new);
        }
        when AFTER_UPDATE{
            ActivecheckContact.afterUpdate(Trigger.new,Trigger.oldMap);
        }
        when AFTER_DELETE{
            ActivecheckContact.afterDelete(Trigger.old);
        }
        when AFTER_UNDELETE{
            ActivecheckContact.afterUndelete(Trigger.new);
        }
        
    }
}