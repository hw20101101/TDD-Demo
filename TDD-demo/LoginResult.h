//
//  LoginResult.h
//  TDD-demo
//
//  Created by 123 on 2025/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginResult : NSObject

@property (nonatomic, readonly) BOOL success;
@property (nonatomic, readonly) NSError *error;
- (instancetype)initWithSuccess:(BOOL)success error:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
