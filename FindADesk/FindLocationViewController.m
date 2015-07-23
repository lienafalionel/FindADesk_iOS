//
//  FindLocationViewController.m
//  FindADesk
//
//  Created by Lionel Lienafa on 01/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "FindLocationViewController.h"
#import "WorkspaceService.h"
#import "WorkspaceTypeService.h"
#import "WorkspaceListViewController.h"

#define SEGUE_TO_WORKSPACE      @"SearchToWorkspace"

@interface FindLocationViewController () 
@property (weak, nonatomic) IBOutlet UITextField *fieldWorkspaceType;
@property (weak, nonatomic) IBOutlet UITextField *fieldCity;
@property (weak, nonatomic) IBOutlet UITextField *fieldSeats;
@property (weak, nonatomic) IBOutlet UITextField *fieldMinPrice;
@property (weak, nonatomic) IBOutlet UITextField *fieldMaxPrice;
@property (weak, nonatomic) IBOutlet UIButton *btnSearchBooking;
@property (weak, nonatomic) WorkspaceService * workspaceService;
@property (weak, nonatomic) WorkspaceTypeService * workspaceTypeService;
@property (strong, nonatomic) NSArray *workspaceTypes;
@property (strong, nonatomic) NSArray *workspaces;
@end

@implementation FindLocationViewController

#pragma mark - Privates
- (void)setupModel{
    self.workspaceService = [WorkspaceService sharedInstance];
    self.workspaceTypeService = [WorkspaceTypeService sharedInstance];
    /*[self.workspaceTypeService getWorkspaceTypesWithcompletion:^(NSArray *array) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.workspaceTypes = array;
        });
    }];
    
    UIPickerView* picker = [[UIPickerView alloc]init];
    [self.fieldWorkspaceType setInputView:picker];*/
}

/*- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.workspaceTypes.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return [[self.workspaceTypes objectAtIndex:row] label];
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupModel];
}

- (IBAction)didSearchLocationAction:(id)sender {
    NSString *city = self.fieldCity.text;
    NSNumber *seats = [NSNumber numberWithInteger:[self.fieldSeats.text integerValue]];
    NSNumber *minPrice = [NSNumber numberWithInteger:[self.fieldMinPrice.text integerValue]];
    NSNumber *maxPrice = [NSNumber numberWithInteger:[self.fieldMaxPrice.text integerValue]];
    NSNumber *idWorkspaceType = [NSNumber numberWithInt:1];
    [self.workspaceService getWorkspacesByCriteriaWithcompletion:idWorkspaceType city:city seats:seats minPrice:minPrice maxPrice:maxPrice completion:^(NSArray *workspaces) {
        self.workspaces = [workspaces mutableCopy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:SEGUE_TO_WORKSPACE sender:nil];
        });
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SEGUE_TO_WORKSPACE]){
        WorkspaceListViewController *controller = segue.destinationViewController;
        controller.workspaces = self.workspaces;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
