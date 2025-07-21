//
//  LoginService.h
//  TDD-demo
//
//  Created by 123 on 2025/7/21.
//

#import <Foundation/Foundation.h>
#import "LoginResult.h"
#import "LoginCredentials.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginService : NSObject

- (BOOL)validateUsername:(NSString *)username;

// LoginService.h (添加新方法)
- (BOOL)validatePassword:(NSString *)password;

// LoginService.h (添加新方法)
typedef void(^LoginCompletionHandler)(LoginResult *result);
- (void)loginWithCredentials:(LoginCredentials *)credentials
                  completion:(LoginCompletionHandler)completion;

@end

NS_ASSUME_NONNULL_END
