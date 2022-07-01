/**
 * Created by alexanderbelenov on 01.07.2022.
 */
@IsTest
public with sharing class AccountTriggerHandlerTest {
    @IsTest private static void testBeforeInsert() {
        AccountTriggerHandler handler = new AccountTriggerHandler();
        handler.accountServ = (AccountService)MockUtil.createMock(AccountService.class);
        handler.newList = TestUtils.getAccountList('', 1, false);
        handler.beforeInsert();
        System.assertEquals(false, handler.newList.get(0).hasErrors());
    }
}