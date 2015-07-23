//
//  BookingViewController.h
//  FindADesk
//
//  Created by Lionel Lienafa on 06/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Workspace.h"

@interface BookingViewController : UIViewController
@property (strong, nonatomic) Workspace *workspace;
extern User *userConnected;
@end
