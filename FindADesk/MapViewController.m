//
//  MapViewController.m
//  FindADesk
//
//  Created by Lionel Lienafa on 07/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "MapViewController.h"
#import "WorkspaceService.h"
#import "Annotation.h"
#import "WorkspaceViewController.h"

#define SEGUE_TO_WORKSPACE      @"MapToWorkspace"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) WorkspaceService *workspaceService;
@property (strong, nonatomic) NSArray *workspaces;
@property (strong, nonatomic) Workspace *workspaceSelected;
@end

@implementation MapViewController
#pragma mark - Privates
- (void)setupModel{
    self.workspaceService = [WorkspaceService sharedInstance];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupModel];
    self.mapView.delegate = self;
    
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = YES;
    
    [self.workspaceService getWorkspacesWithcompletion:^(NSArray *workspaces) {
        self.workspaces = [workspaces mutableCopy];
        dispatch_async(dispatch_get_main_queue(), ^{
            for(int i = 0; i < [self.workspaces count]; i++) {
                Workspace *workspace = [self.workspaces objectAtIndex:i];
                CLLocationCoordinate2D location;
                location.latitude = [workspace.latitude doubleValue];
                location.longitude = [workspace.longitude doubleValue];
                
                Annotation *newAnnotation = [[Annotation alloc] initWithWorkspace:workspace andCoordinate:location];
                
                /*MKPointAnnotation *newAnnotation = [[MKPointAnnotation alloc] init];
                newAnnotation 
                newAnnotation.coordinate = location;*/
                [self.mapView addAnnotation:newAnnotation];
            }
        });
    }];
}

- (void)  mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    Annotation *annotation = view.annotation;
    self.workspaceSelected = annotation.workspace;
    [self performSegueWithIdentifier:SEGUE_TO_WORKSPACE sender:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CLLocationCoordinate2D coord = {.latitude =  48.848384, .longitude =  2.395914};
    MKCoordinateSpan span = {.latitudeDelta =  0.02, .longitudeDelta =  0.02};
    MKCoordinateRegion region = {coord, span};
    [self.mapView setRegion:region];
    [self.mapView setZoomEnabled:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTouchStandardTypeButton:(id)sender {
    self.mapView.mapType = MKMapTypeStandard;
}

- (IBAction)didTouchSatelliteTypeButton:(id)sender {
    self.mapView.mapType = MKMapTypeSatellite;
}

- (IBAction)didTouchHybridTypeButton:(id)sender {
    self.mapView.mapType = MKMapTypeHybrid;
}

- (CLLocationCoordinate2D) geoCodeUsingAddress:(NSString *)address
{
    double latitude = 0.0;
    double longitude = 0.0;
    
    NSString *esc_addr =  [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
    
    NSError *jsonError;
    NSData *data= [[NSString stringWithContentsOfURL: [NSURL URLWithString: req] encoding: NSUTF8StringEncoding error: NULL] dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *googleResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
    
    NSDictionary    *resultsDict = [googleResponse valueForKey:  @"results"];   // get the results dictionary
    NSDictionary   *geometryDict = [resultsDict valueForKey: @"geometry"];   // geometry dictionary within the  results dictionary
    NSDictionary   *locationDict = [geometryDict valueForKey: @"location"];   // location dictionary within the geometry dictionary
    
    NSArray *latArray = [locationDict valueForKey: @"lat"];
    NSString *latString = [latArray lastObject];     // (one element) array entries provided by the json parser
    
    NSArray *lngArray = [locationDict valueForKey: @"lng"];
    NSString *lngString = [lngArray lastObject];     // (one element) array entries provided by the json parser
    
    CLLocationCoordinate2D location;
    location.latitude = [latString doubleValue];// latitude;
    location.longitude = [lngString doubleValue]; //longitude;
    
    return location;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    WorkspaceViewController *controller = segue.destinationViewController;
    controller.workspace = self.workspaceSelected;
}


@end
