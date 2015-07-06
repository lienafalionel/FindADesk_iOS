//
//  Artist+JSONSerializer.h
//  FindADesk
//
//  Created by Lionel Lienafa on 17/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "Artist.h"

@interface Artist (JSONSerializer)
+ (Artist *)artistFromJSON:(NSDictionary *)JSON;
- (NSDictionary *)toJSON;
@end
