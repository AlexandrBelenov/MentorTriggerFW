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

    @IsTest private static void testBeforeInsertSuccess() {
        Account oneAccount = TestUtils.getAccount('', false);
        Database.SaveResult result = null;
        try {
            result = Database.insert(oneAccount);
        } catch (Exception ex) {
            System.assert(false);
        }
        System.assertEquals(true, result.success);
    }

    @IsTest private static void testBeforeInsertError() {
        TestUtils.getAccount('SameName', true);
        Account sameAccount = TestUtils.getAccount('SameName', false);
        Database.SaveResult result = Database.insert(sameAccount, false);
        System.assertEquals(false, result.errors.isEmpty());
        System.assertEquals(Label.Account_With_Name_Already_Exists, result.errors.get(0).message);
    }
}