//
//  WorkspaceViewController.h
//  FindADesk
//
//  Created by Lionel Lienafa on 05/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workspace+JSONSerializer.h"

@interface WorkspaceViewController : UIViewController
@property (strong, nonatomic) Workspace *workspace;
@end
