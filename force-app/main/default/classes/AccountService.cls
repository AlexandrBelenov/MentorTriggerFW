/**
 * Created by alexanderbelenov on 30.06.2022.
 */

public with sharing class AccountService {
    @TestVisible
    private AccountRepository accRepository;
    public AccountService() { // TODO: Ask how properly mock singletones
        this.accRepository = AccountRepository.getInstance();
    }
    public void checkIfExistAll(List<Account> accounts) {
        if (accounts == null) { return; }
        final Set<String> accountNames = this.getNames(accounts);
        final List<Account> existedAccounts = accRepository.getAccountsByNames(accountNames);

        for (Account account : accounts) {
            for (Account existedAccount : existedAccounts) {
                if (account.Name == existedAccount.Name) {
                    account.addError(System.Label.Account_With_Name_Already_Exists);
                }
            }
        }
    }

    @TestVisible
    private Set<String> getNames(List<Account> accounts) {
        final Set<String> accountNames = new Set<String>();
        if (accounts != null) {
            for (Account account : accounts) {
                accountNames.add(account.Name);
            }
        }
        return accountNames;
    }

    private static AccountService instance;
    public static AccountService getInstance() {
        if (instance == null) {
            instance = new AccountService();
        }
        return instance;
    }
}