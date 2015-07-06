//
//  WorkspaceListViewController.m
//  FindADesk
//
//  Created by Lionel Lienafa on 02/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "WorkspaceListViewController.h"
#import "WorkspaceService.h"
#import "WorkspaceViewController.h"

#define WORKSPACE_CELL_ID   @"WorkspaceCellIdentifier"
#define SEGUE_TO_WORKSPACE  @"SegueToWorkspace"

@interface WorkspaceListViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableWorkspaces;
@property (weak, nonatomic) WorkspaceService *workspaceService;
@property (strong, nonatomic) Workspace *selectedWorkspace;
@end

@implementation WorkspaceListViewController
#pragma mark - Privates
- (void)setupModel{
    self.workspaceService = [WorkspaceService sharedInstance];
}

- (void)configureOutlets{
    self.tableWorkspaces.delegate = self;
    self.tableWorkspaces.dataSource = self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupModel];
    [self configureOutlets];
    [self.tableWorkspaces reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.workspaces.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WORKSPACE_CELL_ID forIndexPath:indexPath];
    Workspace *workspace = self.workspaces[indexPath.row];
    cell.textLabel.text = workspace.workspaceType.label;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@     %@€", workspace.city, workspace.price];
    // Configure the cell...
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SEGUE_TO_WORKSPACE]){
        WorkspaceViewController *controller = segue.destinationViewController;
        controller.workspace = self.selectedWorkspace;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedWorkspace = self.workspaces[indexPath.row];
    [self performSegueWithIdentifier:SEGUE_TO_WORKSPACE sender:self];
}

@end
