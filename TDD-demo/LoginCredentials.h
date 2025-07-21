//
//  LoginCredentials.h
//  TDD-demo
//
//  Created by 123 on 2025/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginCredentials : NSObject

@property (nonatomic, readonly) NSString *username;
@property (nonatomic, readonly) NSString *password;
- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
