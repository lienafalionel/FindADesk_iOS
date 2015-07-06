//
//  Reservation.h
//  FindADesk
//
//  Created by Lionel Lienafa on 21/05/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workspace.h"
#import "User.h"
#import "CardType.h"

@interface Booking : NSObject

@property (nonatomic, retain) NSNumber * bookingId;
@property (nonatomic, retain) Workspace * workspace;
@property (nonatomic, retain) User * user;
@property (nonatomic, retain) NSDate * begin;
@property (nonatomic, retain) NSDate * end;
@property (nonatomic, retain) NSDate * bookingDate;
@property (nonatomic, retain) NSDecimalNumber * price;
@property (nonatomic, retain) CardType * cardType;
@end
