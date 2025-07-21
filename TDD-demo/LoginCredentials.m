//
//  LoginCredentials.m
//  TDD-demo
//
//  Created by 123 on 2025/7/21.
//

#import "LoginCredentials.h"

@implementation LoginCredentials

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    if (self) {
        _username = username;
        _password = password;
    }
    return self;
}

@end
