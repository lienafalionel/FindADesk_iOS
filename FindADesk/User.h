//
//  User.h
//  FindADesk
//
//  Created by Lionel Lienafa on 21/05/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSString * company;

@end
