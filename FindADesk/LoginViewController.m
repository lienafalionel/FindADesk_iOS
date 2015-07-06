//
//  LoginViewController.m
//  FindADesk
//
//  Created by Lionel Lienafa on 15/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "LoginViewController.h"
#import "AuthenticationService.h"
#import "UserService.h"
#import "HomeViewController.h"
#import "User.h"
#import "SessionManager.h"
#import "User+JSONSerializer.h"

#define SEGUE_TO_HOME       @"LoginToHome"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *fieldPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnConnection;
@property (weak, nonatomic) AuthenticationService * authenticationService;
@property (weak, nonatomic) UserService * userService;
@property (strong, nonatomic) User *user;
@end

@implementation LoginViewController
#pragma mark - Privates
- (void)setupModel{
    self.authenticationService = [AuthenticationService sharedInstance];
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
- (IBAction)didTouchConnectionButton:(id)sender {
    /*if([self.fieldEmail.text isEqualToString:@""] || [self.fieldPassword.text isEqualToString:@"" ])
        return;*/
    
    [self.userService getUserWithcompletion:@"1" completion:^(User *userFound) {
        self.user = userFound;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:SEGUE_TO_HOME sender:nil];
        });
        
    }];    
                 
    /*[self.authenticationService authenticateWithEmail:self.fieldEmail.text password:self.fieldPassword.text success:^{
        NSLog(@"Success");
        [self performSegueWithIdentifier:SEGUE_TO_HOME sender:nil];
    } error:^{
        NSLog(@"erreur connexion");
    }];*/
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SEGUE_TO_HOME]){
        HomeViewController *controller = segue.destinationViewController;
        controller.user = self.user;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
