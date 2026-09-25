using Toybox.Test;

(:test)
function sleepTimerIsDue(logger) {
    Test.assert(!SleepTimer.isDue(null, 1000));
    Test.assert(!SleepTimer.isDue(1000, 999));
    Test.assert(SleepTimer.isDue(1000, 1000));
    Test.assert(SleepTimer.isDue(1000, 5000));
    logger.debug("unarmed never fires; armed fires at and after the deadline");
    return true;
}

(:test)
function sleepTimerFiresOnce(logger) {
    SleepTimer.deadline = 1;
    Test.assert(SleepTimer.fire());
    Test.assert(!SleepTimer.fire());
    Test.assert(SleepTimer.deadline == null);
    logger.debug("expiry stops one part, then playback continues normally");
    return true;
}
