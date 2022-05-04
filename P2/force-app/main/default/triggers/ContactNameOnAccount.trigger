trigger ContactNameOnAccount on Contact (after insert, after update) {
    if (trigger.isAfter) {
        if (trigger.isInsert || trigger.isUpdate) {
            ContactAccountHandler.relateContactToAccount(trigger.new);
        }
    }

}