//
//  Booking+JSONSerializer.m
//  FindADesk
//
//  Created by Lionel Lienafa on 17/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "Booking+JSONSerializer.h"
#import "Workspace+JSONSerializer.h"
#import "User+JSONSerializer.h"

#define TODO_DATE_FORMAT @"dd/mm/yyyy"
@implementation Booking (JSONSerializer)

+ (Booking *)bookingFromJSON:(NSDictionary *)JSON{
    if(!JSON)
        return nil;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = TODO_DATE_FORMAT;
    
    Booking *booking = [[Booking alloc] init];
    for (id key in JSON){
        if([key isEqualToString:@"workspace"])
            booking.workspace = [Workspace workspaceFromJSON:JSON[key]];
        else if([key isEqualToString:@"user"])
            booking.user = [User userFromJSON:JSON[key]];
        else if([key isEqualToString:@"begin"]) {
            float seconds = [JSON[key] floatValue] / 1000;
            booking.begin = [NSDate dateWithTimeIntervalSince1970:seconds];
        }
        else if([key isEqualToString:@"end"]) {
            float seconds = [JSON[key] floatValue] / 1000;
            booking.end = [NSDate dateWithTimeIntervalSince1970:seconds];
        }
        else
            [booking setValue:JSON[key] forKey:key];
    }
    return booking;
}

- (NSDictionary *)toJSON{
    NSMutableDictionary *json = [@{} mutableCopy];
    if(self.bookingId)
        [json setObject:self.bookingId forKey:@"bookingId"];
    return json;
}

@end
