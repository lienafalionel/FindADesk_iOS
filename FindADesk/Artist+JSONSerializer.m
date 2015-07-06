//
//  Artist+JSONSerializer.m
//  FindADesk
//
//  Created by Lionel Lienafa on 17/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "Artist+JSONSerializer.h"

@implementation Artist (JSONSerializer)
+ (Artist *)artistFromJSON:(NSDictionary *)JSON{
    if(!JSON)
        return nil;
    
    Artist *artist;
    for (id key in JSON){
        if([artist respondsToSelector:NSSelectorFromString(key)]) {
            [artist setValue:JSON[key] forKey:key];
        }
    }
    return artist;
}

- (NSDictionary *)toJSON{
    
    NSMutableDictionary *json = [@{} mutableCopy];
    if(self.id)
        [json setObject:self.id forKey:@"id"];
    if(self.name)
        [json setObject:self.name forKey:@"name"];
    if (self.link) {
        [json setObject:self.link forKey:@"link"];
    }
    
    return json;
}
@end
