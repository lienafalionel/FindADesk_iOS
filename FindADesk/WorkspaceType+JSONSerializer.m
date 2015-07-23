//
//  WorkspaceType+JSONSerializer.m
//  FindADesk
//
//  Created by Lionel Lienafa on 02/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "WorkspaceType+JSONSerializer.h"

@implementation WorkspaceType (JSONSerializer)

+ (WorkspaceType *)workspaceTypeFromJSON:(NSDictionary *)JSON{
    if(!JSON)
        return nil;
    WorkspaceType *workspaceType = [[WorkspaceType alloc] init];
    for (id key in JSON){
        if([workspaceType respondsToSelector:NSSelectorFromString(key)]) {
            [workspaceType setValue:JSON[key] forKey:key];
        }
    }
    return workspaceType;
}

- (NSDictionary *)toJSON{
    NSMutableDictionary *json = [@{} mutableCopy];
    if(self.workspaceTypeid)
        [json setObject:self.workspaceTypeid forKey:@"workspaceTypeId"];
    if(self.label)
        [json setObject:self.label forKey:@"label"];
    return json;
}

@end
