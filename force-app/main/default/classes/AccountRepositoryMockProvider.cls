/**
 * Created by alexanderbelenov on 01.07.2022.
 */

public with sharing class AccountRepositoryMockProvider implements System.StubProvider {

    public Object handleMethodCall(Object stubbedObject, String stubbedMethodName, Type returnType,
            List<Type> parameterTypes, List<String> parameterNames, List<Object> arguments) {
        if (stubbedMethodName == 'getAccountsByNames') {
            final List<Account> accounts = new List<Account>();
            accounts.add(new Account(Name='MockedAccount0'));
            accounts.add(new Account(Name='MockedAccount1'));
            accounts.add(new Account(Name='MockedAccount2'));
            return accounts;
        }
        return null;
    }
}