//
//  WorkspaceTypeService.h
//  FindADesk
//
//  Created by Lionel Lienafa on 23/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorkspaceType.h"

@interface WorkspaceTypeService : NSObject
#pragma mark - Singleton Pattern
+ (instancetype)sharedInstance;

- (void)getWorkspaceTypesWithcompletion:(void (^)(NSArray *))completion;
- (void)getWorkspaceTypeWithcompletion:(NSString *)idWorkspaceType completion:(void (^)(WorkspaceType *))completion;
@end
