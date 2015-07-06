//
//  User+JSONSerializer.h
//  FindADesk
//
//  Created by Lionel Lienafa on 22/05/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "User.h"

@interface User (JSONSerializer)
+ (User *)userFromJSON:(NSDictionary *)JSON;
- (NSDictionary *)toJSON;
@end
