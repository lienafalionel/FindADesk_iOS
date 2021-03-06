//
//  UserService.h
//  FindADesk
//
//  Created by Lionel Lienafa on 02/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserService : NSObject
#pragma mark - Singleton Pattern

+ (instancetype)sharedInstance;

- (void)createUser:(User *)user completion:(void(^)(User *))completion;
- (void)createUser:(NSString *)firstName lastName:(NSString *)lastName address:(NSString *)address email:(NSString *)email password:(NSString *)password phoneNumber:(NSString *)phoneNumber company:(NSString *)company completion:(void(^)(User *))completion;
- (void)updateUser:(User *)user completion:(void(^)(User *))completion;
- (void)deleteUser:(User *)artist completion:(void(^)(User *))completion;
- (void)getUserWithcompletion:(NSString *)name completion:(void (^)(User *))completion;
- (void)getBookingsByUserWithcompletion:(NSNumber *)userId completion:(void (^)(NSArray *))completion;
- (void)getUsersWithcompletion:(NSString *)name completion:(void (^)(NSArray *))completion;
- (void)getUserByMailAndPassword:(NSString *)email password:(NSString *)password completion:(void (^)(User *))completion;
@end
