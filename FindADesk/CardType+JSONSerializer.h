//
//  CardType+JSONSerializer.h
//  FindADesk
//
//  Created by Lionel Lienafa on 02/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "CardType.h"

@interface CardType (JSONSerializer)

+ (CardType *)cardtypeFromJSON:(NSDictionary *)JSON;
- (NSDictionary *)toJSON;

@end
