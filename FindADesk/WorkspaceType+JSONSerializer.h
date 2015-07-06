//
//  WorkspaceType+JSONSerializer.h
//  FindADesk
//
//  Created by Lionel Lienafa on 02/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "WorkspaceType.h"

@interface WorkspaceType (JSONSerializer)

+ (WorkspaceType *)workspaceTypeFromJSON:(NSDictionary *)JSON;
- (NSDictionary *)toJSON;

@end
