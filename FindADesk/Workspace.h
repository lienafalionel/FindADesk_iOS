//
//  Workspace.h
//  FindADesk
//
//  Created by Lionel Lienafa on 21/05/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorkspaceType.h"

@interface Workspace : NSObject

@property (nonatomic, retain) NSNumber * workspaceId;
@property (nonatomic, retain) NSDecimalNumber * price;
@property (nonatomic, retain) NSNumber * seatsNumber;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * userEmail;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * zipCode;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSDecimalNumber * longitude;
@property (nonatomic, retain) NSDecimalNumber * latitude;
@property (nonatomic, retain) WorkspaceType * workspaceType;

@end
