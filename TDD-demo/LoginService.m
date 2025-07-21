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

// LoginService.m (重构 - REFACTOR)
- (void)loginWithCredentials:(LoginCredentials *)credentials
                  completion:(LoginCompletionHandler)completion {
    // 先验证
    if (![self validateUsername:credentials.username]) {
        NSError *error = [NSError errorWithDomain:@"ValidationError"
                                             code:400
                                         userInfo:@{NSLocalizedDescriptionKey: @"Invalid username"}];
        LoginResult *result = [[LoginResult alloc] initWithSuccess:NO error:error];
        completion(result);
        return;
    }
    
    if (![self validatePassword:credentials.password]) {
        NSError *error = [NSError errorWithDomain:@"ValidationError"
                                             code:400
                                         userInfo:@{NSLocalizedDescriptionKey: @"Invalid password"}];
        LoginResult *result = [[LoginResult alloc] initWithSuccess:NO error:error];
        completion(result);
        return;
    }
    
    // 执行登录
    [self performLoginWithCredentials:credentials completion:completion];
}

- (void)performLoginWithCredentials:(LoginCredentials *)credentials
                         completion:(LoginCompletionHandler)completion {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        if ([credentials.username isEqualToString:@"testuser"] &&
            [credentials.password isEqualToString:@"password123"]) {
            LoginResult *result = [[LoginResult alloc] initWithSuccess:YES error:nil];
            completion(result);
        } else {
            NSError *error = [NSError errorWithDomain:@"LoginError"
                                                 code:401
                                             userInfo:@{NSLocalizedDescriptionKey: @"Invalid credentials"}];
            LoginResult *result = [[LoginResult alloc] initWithSuccess:NO error:error];
            completion(result);
        }
    });
}

@end
