//
//  HomeViewController.m
//  FindADesk
//
//  Created by Lionel Lienafa on 12/05/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "HomeViewController.h"
#import "BookingService.h"
#import "MyBookingsListViewController.h"

#define SEGUE_TO_MY_BOOKINGS    @"HomeToMyBookings"
#define SEGUE_TO_MAP            @"HomeToMap"
#define SEGUE_TO_LOGIN          @"HomeToLogin"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnMyBookings;
@property (weak, nonatomic) IBOutlet UILabel *lblLastName;
@property (weak, nonatomic) IBOutlet UILabel *lblFirstName;
@property (weak, nonatomic) BookingService * bookingService;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lblFirstName.text = userConnected.firstName;
    self.lblLastName.text = userConnected.lastName;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SEGUE_TO_MY_BOOKINGS]){
        MyReservationsListViewController *controller = segue.destinationViewController;
        controller.user = user;
        
    }
}*/

- (IBAction)didTouchMyBookingsButton:(id)sender {
    [self performSegueWithIdentifier:SEGUE_TO_MY_BOOKINGS sender:nil];
}

- (IBAction)didTouchMapButton:(id)sender {
    [self performSegueWithIdentifier:SEGUE_TO_MAP sender:nil];
}

- (IBAction)didTouchDeconnectionButton:(id)sender {
    userConnected = nil;
    [self performSegueWithIdentifier:SEGUE_TO_LOGIN sender:nil];
}
@end
