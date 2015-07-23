//
//  BookingService.h
//  FindADesk
//
//  Created by Lionel Lienafa on 30/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Booking.h"
#import "WorkspaceType.h"

@interface BookingService : NSObject
#pragma mark - Singleton Pattern
+ (instancetype)sharedInstance;

- (void)getBookingWithcompletion:(NSString *)idBooking completion:(void (^)(Booking *))completion;
- (void)createBooking:(Booking *)booking completion:(void(^)(Booking *))completion;
- (void)createbooking:(User *)user workspace:(Workspace *)workspace begin:(NSDate *)begin end:(NSDate *)end completion:(void (^)(Booking *))completion;
- (void)deleteBooking:(Booking *)booking completion:(void (^)(Booking *))completion;
@end
