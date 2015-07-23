//
//  WorkspaceTypeService.m
//  FindADesk
//
//  Created by Lionel Lienafa on 23/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "WorkspaceTypeService.h"
#import "WorkspaceType+JSONSerializer.h"
#import "SessionManager.h"

@implementation WorkspaceTypeService
static WorkspaceTypeService *sharedInstance = nil;

#pragma mark - Singleton Pattern -
+ (instancetype)sharedInstance{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if(sharedInstance == nil)
            sharedInstance = [[super allocWithZone:NULL] init];
    });
    return sharedInstance;
}
+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}
- (id)copyWithZone:(NSZone *)zone{
    return self;
}
- (id)init{
    if(nil != (self = [super init]))
    {}
    return self;
}

- (void)getWorkspaceTypeWithcompletion:(NSString *)idWorkspaceType completion:(void (^)(WorkspaceType *))completion{
    NSString *url = [NSString stringWithFormat:@"/workspaceTypes/%@,", idWorkspaceType];
    [[SessionManager sharedInstance] GET:url completion:^(NSDictionary * JSON) {
        WorkspaceType *workspaceType = [WorkspaceType workspaceTypeFromJSON:JSON];
        if(completion) completion(workspaceType);
    }];
}

- (void)getWorkspaceTypesWithcompletion:(void (^)(NSArray *))completion{
    
    [[SessionManager sharedInstance] LIST:@"/workspaceTypes" completion:^(NSArray * JSON) {
        NSMutableArray *array = [@[] mutableCopy];
        for (NSDictionary *object in JSON){
        WorkspaceType *workspaceType = [WorkspaceType workspaceTypeFromJSON:object];
        [array addObject:workspaceType];
    }
    if (completion) completion(array);
    }];
}
@end
