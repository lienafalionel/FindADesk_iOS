//
//  Workspace+JSONSerializer.h
//  FindADesk
//
//  Created by Lionel Lienafa on 26/05/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "Workspace.h"

@interface Workspace (JSONSerializer)
+ (Workspace *)workspaceFromJSON:(NSDictionary *)JSON;
- (NSDictionary *)toJSON;
@end
