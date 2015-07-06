//
//  Artist.h
//  FindADesk
//
//  Created by Lionel Lienafa on 17/06/2015.
//  Copyright (c) 2015 Lionel Lienafa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * nb_album;
@property (nonatomic, retain) NSNumber * nb_fan;
@property (nonatomic, retain) NSString * picture;
@property (nonatomic, retain) NSNumber * radio;
@property (nonatomic, retain) NSString * tracklist;
@property (nonatomic, retain) NSString * type;
@end
