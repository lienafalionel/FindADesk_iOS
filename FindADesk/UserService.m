//
//  UserService.m
//  FindADesk
//
//  Created by Lionel Lienafa on 02/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "UserService.h"
#import "SessionManager.h"
#import "User+JSONSerializer.h"
#import "Booking+JSONSerializer.h"

@implementation UserService
static UserService *sharedInstance = nil;

#pragma mark - Singleton Pattern -
+ (instancetype)sharedInstance{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if(sharedInstance == nil)
            sharedInstance = [[super allocWithZone:NULL] init];
    });
    return sharedInstance;
}
+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}
- (id)copyWithZone:(NSZone *)zone{
    return self;
}
- (id)init{
    if(nil != (self = [super init]))
    {}
    return self;
}


- (void)createUser:(User *)user completion:(void(^)(User *))completion{
    [[SessionManager sharedInstance] POST:@"/user" data:@{@"user" : user.toJSON} completion:^(NSDictionary *JSON) {
        User *createdUser = [User userFromJSON:JSON];
        if(completion) completion(createdUser);
    }];
}

- (void)createUser:(NSString *)firstName lastName:(NSString *)lastName address:(NSString *)address email:(NSString *)email password:(NSString *)password phoneNumber:(NSString *)phoneNumber company:(NSString *)company completion:(void(^)(User *))completion{
    NSString *url = [NSString stringWithFormat:@"/users/create/%@/%@/%@/%@/%@/%@/%@", firstName, lastName, address, email, password, phoneNumber, company];
    [[SessionManager sharedInstance] GET:url completion:^(NSDictionary *JSON) {
        User *createdUser = [User userFromJSON:JSON];
        if(completion) completion(createdUser);
    }];
}

- (void)updateUser:(User *)user completion:(void(^)(User *))completion{
    [[SessionManager sharedInstance] PUT:@"/users" data:@{@"user" : user.toJSON} completion:^(NSDictionary *JSON) {
        User *updatedUser = [User userFromJSON:JSON];
        if (completion) completion(updatedUser);
    }];
}

- (void)deleteUser:(User *)user completion:(void(^)(User *))completion{
    NSString *url = [NSString stringWithFormat:@"/users/%@", user.userId];
    [[SessionManager sharedInstance] DELETE:url data:nil completion:^(NSDictionary *JSON){
        User *deletedUser = [User userFromJSON:JSON];
        if (completion) completion(deletedUser);
    }];
}

- (void)getUserWithcompletion:(NSNumber *)id completion:(void (^)(User *))completion{
    NSString *url = [NSString stringWithFormat:@"/users/%@", id];
    [[SessionManager sharedInstance] GET:url completion:^(NSDictionary * JSON) {
        User *user = [User userFromJSON:JSON];
        if(completion) completion(user);
    }];
}

- (void)getBookingsByUserWithcompletion:(NSNumber *)userId completion:(void (^)(NSArray *))completion{
    NSString *url = [NSString stringWithFormat:@"/users/%@/bookings", userId];
    [[SessionManager sharedInstance] LIST:url completion:^(NSArray * JSON) {
        NSMutableArray *bookings = [@[] mutableCopy];
        for (NSDictionary *object in JSON){
            Booking *booking = [Booking bookingFromJSON:object];
            [bookings addObject:booking];
        }
        if (completion) completion(bookings);
    }];
}


- (void)getUsersWithcompletion:(NSString *)name completion:(void (^)(NSArray *))completion{
    NSString *url = @"/users";
    [[SessionManager sharedInstance] LIST:url completion:^(NSArray * JSON) {
        NSMutableArray *users = [@[] mutableCopy];
        for (NSDictionary *object in JSON){
            User *user = [User userFromJSON:object];
            [users addObject:user];
        }
        if (completion) completion(users);
    }];
}

- (void)getUserByMailAndPassword:(NSString *)email password:(NSString *)password completion:(void (^)(User *))completion{
    NSString *url = [NSString stringWithFormat:@"/users/%@/%@", email, password];
    [[SessionManager sharedInstance] GET:url completion:^(NSDictionary *JSON) {
        User *user = [User userFromJSON:JSON];
        if(completion) completion(user);
    }];
}
@end
