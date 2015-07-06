//
//  CardType+JSONSerializer.m
//  FindADesk
//
//  Created by Lionel Lienafa on 02/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "CardType+JSONSerializer.h"

@implementation CardType (JSONSerializer)

+ (CardType *)cardtypeFromJSON:(NSDictionary *)JSON{
    if(!JSON)
        return nil;
    CardType *cardType;
    for(id key in JSON){
        if([cardType respondsToSelector:NSSelectorFromString(key)]) {
            [cardType setValue:JSON forKey:key];
        }
    }
    return cardType;
}

- (NSDictionary *)toJSON{
    NSMutableDictionary *json = [@{} mutableCopy];
    
    
    
    return json;
}

@end
