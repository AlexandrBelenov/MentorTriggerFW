/**
 * Created by alexanderbelenov on 30.06.2022.
 */

trigger AccountTriggerHandler on Account (
        before insert, before update, before delete,
        after insert, after update, after delete, after undelete) {
    new AccountTriggerHandler().run();
}