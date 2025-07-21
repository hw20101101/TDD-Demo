//
//  TDD_demoTests.m
//  TDD-demoTests
//
//  Created by 123 on 2025/7/21.
//

#import <XCTest/XCTest.h>
#import "LoginService.h"

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


@end
