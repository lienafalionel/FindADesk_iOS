//
//  Booking+JSONSerializer.h
//  FindADesk
//
//  Created by Lionel Lienafa on 17/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "Booking.h"

@interface Booking (JSONSerializer)
+ (Booking *)bookingFromJSON:(NSDictionary *)JSON;
- (NSDictionary *)toJSON;
@end
