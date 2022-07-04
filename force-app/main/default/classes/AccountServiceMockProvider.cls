/**
 * Created by alexanderbelenov on 01.07.2022.
 */

public class AccountServiceMockProvider implements System.StubProvider {

    public Object handleMethodCall(Object stubbedObject, String stubbedMethodName, Type returnType,
            List<Type> parameterTypes, List<String> parameterNames, List<Object> arguments) {
        if (stubbedMethodName == 'checkIfExistAll') {
            // no changes here
        }
        return null;
    }
}