//
//  LoginService.m
//  TDD-demo
//
//  Created by 123 on 2025/7/21.
//

#import "LoginService.h"

@implementation LoginService

// LoginService.m (更新实现 - GREEN)
- (BOOL)validateUsername:(NSString *)username {
    return username.length >= 3;
}

// LoginService.m (实现 - GREEN)
- (BOOL)validatePassword:(NSString *)password {
    return password.length >= 6;
}

@end
