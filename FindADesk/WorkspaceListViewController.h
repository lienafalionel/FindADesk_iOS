//
//  WorkspaceListViewController.h
//  FindADesk
//
//  Created by Lionel Lienafa on 02/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workspace.h"

@interface WorkspaceListViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *workspaces;
@end
