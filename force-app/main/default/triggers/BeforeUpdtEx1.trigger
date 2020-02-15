trigger BeforeUpdtEx1 on Account (before update) {
    for(Account acc: trigger.new){
        if(acc.Rating == null || acc.Rating == ''){
            acc.Rating = 'Cold';
        }
    }

}