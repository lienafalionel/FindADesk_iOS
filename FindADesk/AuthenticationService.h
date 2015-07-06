//
//  AuthenticationService.h
//  FindADesk
//
//  Created by Lionel Lienafa on 15/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface AuthenticationService : NSObject
+ (instancetype)sharedInstance;

@property (strong, nonatomic, readonly, getter=currentUser) User *user;

- (void)authenticateWithEmail:(NSString *)email password:(NSString *)password
                      success:(void (^)(void))success
                        error:(void (^)(void))error;

- (void)registerUser:(NSDictionary *)userDict
             success:(void (^)(void))success
               error:(void (^)(void))error;

@end
