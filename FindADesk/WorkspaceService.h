//
//  WorkspaceService.h
//  FindADesk
//
//  Created by Lionel Lienafa on 02/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workspace.h"
#import "WorkspaceType.h"

@interface WorkspaceService : NSObject
#pragma mark - Singleton Pattern
+ (instancetype)sharedInstance;

- (void)getWorkspacesWithcompletion:(void (^)(NSArray *))completion;
- (void)getWorkspacesByCriteriaWithcompletion:(NSNumber *)idWorkspaceType city:(NSString *)city seats:(NSNumber *)seats minPrice:(NSNumber *)minPrice maxPrice:(NSNumber *)maxPrice completion:(void (^)(NSArray *))completion;
@end
