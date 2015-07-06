//
//  BookingService.m
//  FindADesk
//
//  Created by Lionel Lienafa on 30/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "BookingService.h"
#import "SessionManager.h"
#import "Booking+JSONSerializer.h"

@implementation BookingService
static BookingService *sharedInstance = nil;

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

- (void)getBookingWithcompletion:(NSString *)idBooking completion:(void (^)(Booking *))completion{
    NSString *url = [NSString stringWithFormat:@"/bookings/%@", idBooking];
    [[SessionManager sharedInstance] GET:url completion:^(NSDictionary * JSON) {
        Booking *booking = [Booking bookingFromJSON:JSON];
        if(completion) completion(booking);
    }];
}

- (void)deleteBooking:(Booking *)booking completion:(void (^)(Booking *))completion{
    NSString *url = [NSString stringWithFormat:@"/bookings/%@", booking.bookingId];
    [[SessionManager sharedInstance] DELETE:url data:nil completion:^(NSDictionary * JSON) {
        Booking *deletedBooking = [Booking bookingFromJSON:JSON];
        if (completion) {
            completion(deletedBooking);
        }
    }];
}

@end
