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
    if(self.workspaceId)
        [json setObject:self.workspaceId forKey:@"workspaceId"];
    if(self.price)
        [json setObject:self.price forKey:@"price"];
    if(self.seatsNumber)
        [json setObject:self.seatsNumber forKey:@"seatsNumber"];
    if(self.desc)
        [json setObject:self.desc forKey:@"description"];
    if(self.userEmail)
        [json setObject:self.userEmail forKey:@"userEmail"];
    if(self.address)
        [json setObject:self.address forKey:@"address"];
    if(self.city)
        [json setObject:self.city forKey:@"city"];
    if(self.zipCode)
        [json setObject:self.zipCode forKey:@"zipCode"];
    if(self.country)
        [json setObject:self.country forKey:@"country"];
    if(self.longitude)
        [json setObject:self.longitude forKey:@"longitude"];
    if(self.latitude)
        [json setObject:self.latitude forKey:@"latitude"];
    if(self.workspaceType)
        [json setObject:self.workspaceType.toJSON forKey:@"workspaceType"];
    return json;
}

@end
