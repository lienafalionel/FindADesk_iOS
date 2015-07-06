//
//  Workspace+JSONSerializer.m
//  FindADesk
//
//  Created by Lionel Lienafa on 26/05/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "Workspace+JSONSerializer.h"
#import "WorkspaceType+JSONSerializer.h"

@implementation Workspace (JSONSerializer)

+ (Workspace *)workspaceFromJSON:(NSDictionary *)JSON{
    if(!JSON)
        return nil;
    Workspace *workspace = [[Workspace alloc]init];
    for (id key in JSON){
        if([workspace respondsToSelector:NSSelectorFromString(key)]) {
            if([key isEqualToString:@"description"])
                workspace.desc = JSON[key];
            else if ([key isEqualToString:@"workspaceType"])
                workspace.workspaceType = [WorkspaceType workspaceTypeFromJSON:JSON[key]];
            else
                [workspace setValue:JSON[key] forKey:key];
        }
    }
    return workspace;
}

- (NSDictionary *)toJSON{
    NSMutableDictionary *json = [@{} mutableCopy];
    
    return json;
}

@end
