//
//  LoginResult.m
//  TDD-demo
//
//  Created by 123 on 2025/7/21.
//

#import "LoginResult.h"

@implementation LoginResult

- (instancetype)initWithSuccess:(BOOL)success error:(NSError *)error {
    self = [super init];
    if (self) {
        _success = success;
        _error = error;
    }
    return self;
}

@end
