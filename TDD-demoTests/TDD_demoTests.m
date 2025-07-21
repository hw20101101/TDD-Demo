//
//  TDD_demoTests.m
//  TDD-demoTests
//
//  Created by 123 on 2025/7/21.
//

#import <XCTest/XCTest.h>
#import "LoginService.h"
#import "LoginCredentials.h"
#import "LoginResult.h"

@interface TDD_demoTests : XCTestCase

@property (nonatomic, strong) LoginService *loginService;

@end

@implementation TDD_demoTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.loginService = [[LoginService alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.loginService = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

//- (void)testLoginServiceExists {
//    // RED: 这个测试会失败，因为 LoginService 类还不存在
//    LoginService *service = [[LoginService alloc] init];
//    XCTAssertNotNil(service, @"Login service should exist");
//}

- (void)testLoginServiceExists {
    XCTAssertNotNil(self.loginService, @"Login service should exist");
}

// RED: 测试空用户名
- (void)testEmptyUsernameShouldBeInvalid {
    BOOL isValid = [self.loginService validateUsername:@""];
    XCTAssertFalse(isValid, @"Empty username should be invalid");
}

// RED: 测试有效用户名
- (void)testValidUsernameShouldBeValid {
    BOOL isValid = [self.loginService validateUsername:@"john"];
    XCTAssertTrue(isValid, @"Valid username should be valid");
}

// LoginServiceTests.m (新测试 - RED)
- (void)testUsernameShouldHaveMinimumLength {
    XCTAssertFalse([self.loginService validateUsername:@"ab"]);
    XCTAssertTrue([self.loginService validateUsername:@"abc"]);
}

// LoginServiceTests.m (新测试 - RED)
- (void)testEmptyPasswordShouldBeInvalid {
    BOOL isValid = [self.loginService validatePassword:@""];
    XCTAssertFalse(isValid);
}

// 密码验证 (新测试
- (void)testPasswordShouldHaveMinimumLength {
    XCTAssertFalse([self.loginService validatePassword:@"12345"]);
    XCTAssertTrue([self.loginService validatePassword:@"123456"]);
}

// LoginServiceTests.m (新测试 - RED)
- (void)testLoginCredentialsShouldStoreUsernameAndPassword {
    LoginCredentials *credentials = [[LoginCredentials alloc] initWithUsername:@"john"
                                                                      password:@"secret123"];
    XCTAssertEqualObjects(credentials.username, @"john");
    XCTAssertEqualObjects(credentials.password, @"secret123");
}

// LoginServiceTests.m (新测试 - RED)
- (void)testLoginResultShouldIndicateSuccess {
    LoginResult *result = [[LoginResult alloc] initWithSuccess:YES error:nil];
    XCTAssertTrue(result.success);
    XCTAssertNil(result.error);
}

- (void)testLoginResultShouldIndicateFailure {
    NSError *error = [NSError errorWithDomain:@"LoginError" code:401 userInfo:nil];
    LoginResult *result = [[LoginResult alloc] initWithSuccess:NO error:error];
    XCTAssertFalse(result.success);
    XCTAssertNotNil(result.error);
}

// LoginServiceTests.m (新测试 - RED)
- (void)testLoginWithValidCredentialsShouldSucceed {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Login should succeed"];
    
    LoginCredentials *credentials = [[LoginCredentials alloc] initWithUsername:@"testuser"
                                                                      password:@"password123"];
    
    [self.loginService loginWithCredentials:credentials completion:^(LoginResult *result) {
        XCTAssertTrue(result.success);
        XCTAssertNil(result.error);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2.0 handler:nil];
}

@end
