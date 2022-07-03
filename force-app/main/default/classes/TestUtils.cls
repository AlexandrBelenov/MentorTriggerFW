/**
 * Created by alexanderbelenov on 30.06.2022.
 */
@IsTest
public class TestUtils {
    private static final String DEFAULT_NAME = 'TestAccount';

    public static Set<String> getAccountNamesSet(String name, Integer amount) {
        name = (name == null || name == '')? DEFAULT_NAME : name;

        final Set<String> names = new Set<String>();
        for (Integer i = 0; i < amount; i++) {
            final String newName =  name + i;
            names.add(newName);
        }
        return names;
    }

    public static List<Account> getAccountList(String name, Integer amount, Boolean isSave) {
        name = (name == null || name == '')? DEFAULT_NAME : name;

        final List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < amount; i++) {
            Account account = new Account(Name=name + i);
            accounts.add(account);
        }
        if (isSave) {
            TriggerHandler.bypass('AccountTriggerHandler');
            insert accounts;
            TriggerHandler.clearBypass('AccountTriggerHandler');
        }
        return accounts;
    }

    public static Account getAccount (String name, Boolean isSave) {
        List<Account> oneAccount = getAccountList(name, 1, isSave);
        return oneAccount.get(0);
    }
}