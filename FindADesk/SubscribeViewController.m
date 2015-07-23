//
//  SubscribeViewController.m
//  FindADesk
//
//  Created by Lionel Lienafa on 22/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "SubscribeViewController.h"
#import "UserService.h"

#define SEGUE_TO_LOGIN    @"SubscribeToLogin"

@interface SubscribeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fieldFirstName;
@property (weak, nonatomic) IBOutlet UITextField *fieldLastName;
@property (weak, nonatomic) IBOutlet UITextField *fieldAddress;
@property (weak, nonatomic) IBOutlet UITextField *fieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *fieldPassword;
@property (weak, nonatomic) IBOutlet UITextField *fieldPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *fieldCompany;
@property (weak, nonatomic) IBOutlet UIButton *btnCreateUser;
@property (weak, nonatomic) UserService * userService;
@end

@implementation SubscribeViewController
- (void)setupModel{
    self.userService = [UserService sharedInstance];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupModel];
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
- (IBAction)didSubscribeAction:(id)sender {
    if([self.fieldFirstName.text isEqualToString:@""] || [self.fieldLastName.text isEqualToString:@""] || [self.fieldAddress.text isEqualToString:@""] || [self.fieldEmail.text isEqualToString:@""] || [self.fieldPassword.text isEqualToString:@""] || [self.fieldPhoneNumber.text isEqualToString:@""] || [self.fieldCompany.text isEqualToString:@""])
        return;
    
    [self.userService createUser:self.fieldFirstName.text lastName:self.fieldLastName.text address:self.fieldAddress.text email:self.fieldEmail.text password:self.fieldPassword.text phoneNumber:self.fieldPhoneNumber.text company:self.fieldCompany.text completion:^(User *createdUser) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:SEGUE_TO_LOGIN sender:nil];
        });
    }];
}

@end
