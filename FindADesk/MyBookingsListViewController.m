//
//  MyBookingsListController.m
//  FindADesk
//
//  Created by Lionel Lienafa on 15/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "MyBookingsListViewController.h"
#import "Booking.h"
#import "UserService.h"
#import "BookingService.h"

#define BOOKING_CELL_ID            @"BookingCellIdentifier"

@interface MyReservationsListViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableBookings;
@property (strong, nonatomic) NSArray *bookings;
@property (weak, nonatomic) UserService * userService;
@property (weak, nonatomic) BookingService * bookingService;
@property (strong, nonatomic) Booking *selectedBooking;
@end

@implementation MyReservationsListViewController
#pragma mark - Privates
- (void)setupModel{
    self.userService = [UserService sharedInstance];
    self.bookingService = [BookingService sharedInstance];
}

- (void)configureOutlets{
    self.tableBookings.delegate = self;
    self.tableBookings.dataSource = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupModel];
    [self configureOutlets];
    [self.tableBookings reloadData];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlerLongPress:)];
    lpgr.minimumPressDuration = 0.5;
    lpgr.delegate = self;
    [self.tableBookings addGestureRecognizer:lpgr];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)handlerLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    CGPoint p = [gestureRecognizer locationInView:self.tableBookings];
    NSIndexPath *indexPath = [self.tableBookings indexPathForRowAtPoint:p];
    if (indexPath == nil) {
        NSLog(@"ne trouve pas index path");
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Annuler la réservation ?" message:@"Voulez-vous annuler la réservation ?" delegate:self cancelButtonTitle:@"Confirmer" otherButtonTitles:@"Annuler", nil];
        [alert show];
        self.selectedBooking = self.bookings[indexPath.row];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self.bookingService deleteBooking:self.selectedBooking completion:^(Booking *booking) {
            [self.userService getBookingsByUserWithcompletion:userConnected.userId completion:^(NSArray *bookings) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.bookings = bookings;
                    [self.tableBookings reloadData];
                });
            }];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)viewWillAppear:(BOOL)animated {
 NSNumber *un = [[NSNumber alloc] initWithInt:1];
 [self.userService getBookingsByUserWithcompletion:un completion:^(NSArray * bookingsFound) {
 self.bookings = bookingsFound;
 }];
 }*/

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableBookings reloadData];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.userService getBookingsByUserWithcompletion:userConnected.userId completion:^(NSArray *bookings) {
        self.bookings = [bookings mutableCopy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableBookings reloadData];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.bookings.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BOOKING_CELL_ID forIndexPath:indexPath];
    Booking *booking = self.bookings[indexPath.row];
    NSDateFormatter* fmt = [[NSDateFormatter alloc] init];
    [fmt setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSString* dateStr = [fmt stringFromDate:booking.begin];
    cell.textLabel.text = [NSString stringWithFormat:@"%@                   %@", booking.workspace.workspaceType.label, dateStr];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@     %@€", booking.workspace.city, booking.price];
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end