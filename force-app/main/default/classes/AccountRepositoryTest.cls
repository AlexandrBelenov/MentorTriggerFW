/**
 * Created by alexanderbelenov on 30.06.2022.
 */
@IsTest
private class AccountRepositoryTest {

    @TestSetup private static void setup() {
        TestUtils.getAccountList(null, 3, true);
    }

    @IsTest private static void testGetAccountsByNames() {
        AccountRepository repository = AccountRepository.getInstance();
        Set<String> names = TestUtils.getAccountNamesSet(null, 2);
        List<Account> accounts = repository.getAccountsByNames(names);
        System.assertEquals(accounts.size(), names.size());
    }

    @IsTest private static void testGetAccountsByNamesEmpty() {
        AccountRepository repository = AccountRepository.getInstance();
        Set<String> names = new Set<String>();
        List<Account> accounts = repository.getAccountsByNames(names);
        System.assertEquals(0, accounts.size());
    }

    @IsTest private static void testGetAccountsByNamesNull() {
        AccountRepository repository = AccountRepository.getInstance();
        List<Account> accounts = repository.getAccountsByNames(null);
        System.assertEquals(0, accounts.size());
    }
}