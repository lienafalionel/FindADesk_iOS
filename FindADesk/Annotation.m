//
//  Annotation.m
//  FindADesk
//
//  Created by Lionel Lienafa on 23/07/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

@synthesize workspace,coordinate;

- (id)initWithWorkspace:(Workspace *)wk andCoordinate:(CLLocationCoordinate2D)c2d {
    workspace = wk;
    coordinate = c2d;
    
    return self;
}

@end
