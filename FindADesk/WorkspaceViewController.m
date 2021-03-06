//
//  WorkspaceViewController.m
//  FindADesk
//
//  Created by Lionel Lienafa on 05/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "WorkspaceViewController.h"
#import "Workspace+JSONSerializer.h"
#import "BookingViewController.h"

#define SEGUE_TO_BOOKINGS   @"WorkspaceToBooking"

@interface WorkspaceViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblWorkspaceType;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblSeats;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@end

@implementation WorkspaceViewController
#pragma mark - Privates
- (void)setupModel{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupModel];
    
    self.lblWorkspaceType.text = self.workspace.workspaceType.label;
    self.lblAddress.text = [NSString stringWithFormat:@"%@  %@  %@", self.workspace.address, self.workspace.zipCode, self.workspace.city];
    self.lblSeats.text = [NSString stringWithFormat:@"%@ places", self.workspace.seatsNumber];
    self.lblPrice.text = [NSString stringWithFormat:@"%@ €", self.workspace.price];
    self.lblDescription.text = self.workspace.desc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didBookButton:(id)sender {
    [self performSegueWithIdentifier:SEGUE_TO_BOOKINGS sender:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SEGUE_TO_BOOKINGS]) {
        BookingViewController *controller = segue.destinationViewController;
        controller.workspace = self.workspace;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
