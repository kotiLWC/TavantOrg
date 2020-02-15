trigger descriptionUpdater on Account (after insert, after update) {
    
    System.debug('Making future call to update account');
    for (Account acc : Trigger.New) {
        AccountUpdater.updateAccount(acc.Id, acc.Name);
    }
}