/**
 * Created by alexanderbelenov on 30.06.2022.
 */

public with sharing class AccountRepository {
    public AccountRepository() {} //TODO: Ask - How properly mock singletones?

    public List<Account> getAccountsByNames(Set<String> accountNames) {
        return [
                SELECT Id, Name
                FROM Account
                WHERE Name IN :accountNames
        ];
    }

    private static AccountRepository instance;
    public static AccountRepository getInstance() {
        if (instance == null) {
            instance = new AccountRepository();
        }
        return instance;
    }
}