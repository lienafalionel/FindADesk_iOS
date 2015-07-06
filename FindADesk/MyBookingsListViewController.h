//
//  MyReservationsListController.h
//  FindADesk
//
//  Created by Lionel Lienafa on 15/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface MyReservationsListViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) User *user;
@end
