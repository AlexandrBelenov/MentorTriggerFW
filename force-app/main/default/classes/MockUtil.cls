/**
 * Created by alexanderbelenov on 29.06.2022.
 */

public with sharing class MockUtil {
    private MockUtil() {}

    public static Object createMock(Type typeToMock) {
        Object mock = null;
        if (typeToMock == AccountRepository.class) {
            mock = Test.createStub(typeToMock, new AccountRepositoryMockProvider());
        } else if (typeToMock == AccountService.class) {
            mock = Test.createStub(typeToMock, new AccountServiceMockProvider());
        }
        return mock;
    }
}