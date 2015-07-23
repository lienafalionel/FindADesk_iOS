//
//  BookingViewController.m
//  FindADesk
//
//  Created by Lionel Lienafa on 06/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "BookingViewController.h"
#import "HomeViewController.h"
#import "Workspace+JSONSerializer.h"
#import "BookingService.h"

#define SEGUE_TO_MY_BOOKINGS    @"BookingToMyBookings"

@interface BookingViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextView *addressField;
@property (weak, nonatomic) IBOutlet UITextField *fromField;
@property (weak, nonatomic) IBOutlet UITextField *toField;
@property (weak, nonatomic) IBOutlet UITextField *cardField;
@property (weak, nonatomic) IBOutlet UITextField *cryptogrammeField;
@property (weak, nonatomic) IBOutlet UIButton *paymentBtn;
@property (weak, nonatomic) BookingService * bookingService;
@end

@implementation BookingViewController
#pragma mark - Privates
- (void)setupModel{
    self.bookingService = [BookingService sharedInstance];
    
    UIDatePicker *datePickerFrom = [[UIDatePicker alloc]init];
    [datePickerFrom setDate:[NSDate date]];
    [datePickerFrom addTarget:self action:@selector(updateTextFromField:) forControlEvents:UIControlEventValueChanged];
    [self.fromField setInputView:datePickerFrom];
    
    UIDatePicker *datePickerTo = [[UIDatePicker alloc]init];
    [datePickerTo setDate:[NSDate date]];
    [datePickerTo addTarget:self action:@selector(updateTextToField:) forControlEvents:UIControlEventValueChanged];
    [self.toField setInputView:datePickerTo];
}

-(void)updateTextFromField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.fromField.inputView;
    self.fromField.text = [NSString stringWithFormat:@"%@",picker.date];
}

-(void)updateTextToField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.toField.inputView;
    self.toField.text = [NSString stringWithFormat:@"%@",picker.date];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupModel];
    self.firstNameField.text = userConnected.firstName;
    self.lastNameField.text = userConnected.lastName;
    self.addressField.text = userConnected.address;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didTouchPaymentButton:(id)sender {
    if([self.fromField.text isEqualToString:@""] || [self.toField.text isEqualToString:@""] || [self.cardField.text isEqualToString:@""] || [self.cryptogrammeField.text isEqualToString:@""])
        return;
    UIDatePicker* picker = (UIDatePicker*)self.fromField.inputView;
    NSDate *begin = picker.date;
    picker = (UIDatePicker*)self.toField.inputView;
    NSDate *end = picker.date;
    if(begin > end)
        return;
    [self.bookingService createbooking:userConnected workspace:self.workspace begin:begin end:end completion:^(Booking *booking) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:SEGUE_TO_MY_BOOKINGS sender:nil];
        });
    }];
}


@end
