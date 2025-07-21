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

// LoginService.m (实现 - GREEN)
- (void)loginWithCredentials:(LoginCredentials *)credentials
                  completion:(LoginCompletionHandler)completion {
    // 模拟异步操作
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
