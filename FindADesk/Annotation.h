//
//  Annotation.h
//  FindADesk
//
//  Created by Lionel Lienafa on 23/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "Workspace.h"

@interface Annotation : MKPointAnnotation
@property (nonatomic, retain) Workspace *workspace;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithWorkspace:(Workspace *)workspace andCoordinate:(CLLocationCoordinate2D)c2d;
@end

