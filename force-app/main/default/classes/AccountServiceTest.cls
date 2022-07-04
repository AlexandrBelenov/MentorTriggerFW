/**
 * Created by alexanderbelenov on 30.06.2022.
 */
@IsTest
private class AccountServiceTest {
    private static AccountService service = AccountService.getInstance();


    @IsTest private static void testGetNames() {
        List<Account> accounts = TestUtils.getAccountList(null, 3, false);
        Set<String> names = service.getNames(accounts);
        System.assertEquals(3, names.size());
    }

    @IsTest private static void testGetNamesEmpty() {
        List<Account> accounts = new List<Account>();
        Set<String> names = service.getNames(accounts);
        System.assertEquals(0, names.size());
    }

    @IsTest private static void testGetNamesNull() {
        Set<String> names = service.getNames(null);
        System.assertEquals(0, names.size());
    }

    @IsTest private static void testCheckIfExistAllSuccess() {
        service.accRepository = (AccountRepository)MockUtil.createMock(AccountRepository.class);
        List<Account> accounts = TestUtils.getAccountList('TestAccount', 1, false);
        service.checkIfExistAll(accounts);
        System.assertEquals(false, accounts.get(0).hasErrors());
    }

    @IsTest private static void testCheckIfExistAllError() {
        service.accRepository = (AccountRepository)MockUtil.createMock(AccountRepository.class);
        List<Account> accounts = TestUtils.getAccountList('MockedAccount', 1, false);
        service.checkIfExistAll(accounts);
        System.assertEquals(true, accounts.get(0).hasErrors());
        System.assertEquals(1, accounts.get(0).getErrors().size());
        System.assertEquals(Label.Account_With_Name_Already_Exists, accounts.get(0).getErrors().get(0).message);
    }
}