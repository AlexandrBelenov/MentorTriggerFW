/**
 * Created by alexanderbelenov on 30.06.2022.
 */

public with sharing class AccountTriggerHandler extends TriggerHandler {

    @TestVisible
    private List<Account> newList;
    @TestVisible
    private AccountService accountServ;

    public AccountTriggerHandler() {
        this.newList = (List<Account>)Trigger.new;
        this.accountServ = AccountService.getInstance();
    }

    @TestVisible
    protected override void beforeInsert() {
        this.accountServ.checkIfExistAll(this.newList);
//        throw new CustomException('-------Test exeption--------');
    }
    class CustomException extends Exception {

    }
}