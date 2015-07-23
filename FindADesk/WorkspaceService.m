//
//  WorkspaceService.m
//  FindADesk
//
//  Created by Lionel Lienafa on 02/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "WorkspaceService.h"
#import "BookingService.h"
#import "SessionManager.h"
#import "Workspace+JSONSerializer.h"

@implementation WorkspaceService
static WorkspaceService *sharedInstance = nil;

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

- (void)getWorkspacesWithcompletion:(void (^)(NSArray *))completion{
    NSString *url = @"/workspaces";
    [[SessionManager sharedInstance] LIST:url completion:^(NSArray * JSON) {
        NSMutableArray *workspaces = [@[] mutableCopy];
        for (NSDictionary *object in JSON) {
            Workspace *workspace = [Workspace workspaceFromJSON:object];
            [workspaces addObject:workspace];
        }
        if (completion) {
            completion(workspaces);
        }
    }];
}

- (void)getWorkspacesByCriteriaWithcompletion:(NSNumber *)idWorkspaceType city:(NSString *)city seats:(NSNumber *)seats minPrice:(NSNumber *)minPrice maxPrice:(NSNumber *)maxPrice completion:(void (^)(NSArray *))completion{
    NSString *url = [NSString stringWithFormat:@"/workspacesListing/%@/%@/%@/%@/%@", idWorkspaceType, city, seats, minPrice, maxPrice];
    [[SessionManager sharedInstance] LIST:url completion:^(NSArray * JSON) {
        NSMutableArray *workspaces = [@[] mutableCopy];
        for (NSDictionary *object in JSON) {
            Workspace *workspace = [Workspace workspaceFromJSON:object];
            [workspaces addObject:workspace];
        }
        if (completion) {
            completion(workspaces);
        }
    }];
}
@end
