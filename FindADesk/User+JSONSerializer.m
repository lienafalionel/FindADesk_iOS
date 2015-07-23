//
//  User+JSONSerializer.m
//  FindADesk
//
//  Created by Lionel Lienafa on 22/05/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "User+JSONSerializer.h"

@implementation User (JSONSerializer)

+ (User *)userFromJSON:(NSDictionary *)JSON{
    if(!JSON)
        return nil;
    User *user = [[User alloc]init];
    for (id key in JSON){
        if([user respondsToSelector:NSSelectorFromString(key)]) {
            [user setValue:JSON[key] forKey:key];
        }
    }
    return user;
}

- (NSDictionary *)toJSON{
    NSMutableDictionary *json = [@{} mutableCopy];
    if(self.userId)
        [json setObject:self.userId forKey:@"userId"];
    if(self.firstName)
        [json setObject:self.firstName forKey:@"firstName"];
    if(self.lastName)
        [json setObject:self.lastName forKey:@"lastName"];
    if(self.address)
        [json setObject:self.address forKey:@"address"];
    if(self.email)
        [json setObject:self.email forKey:@"email"];
    if(self.password)
        [json setObject:self.password forKey:@"password"];
    if(self.phoneNumber)
        [json setObject:self.phoneNumber forKey:@"phoneNumber"];
    if(self.company)
        [json setObject:self.company forKey:@"company"];
    return json;
}

@end
