//
//  ArtistService.h
//  DeezCovery
//
//  Created by ESGI on 11/02/2015.
//  Copyright (c) 2015 MLM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

@interface ArtistService : NSObject
#pragma mark - Sigleton Pattern
+ (instancetype)sharedInstance;

- (void)createArtist:(Artist *)artist completion:(void(^)(Artist *))completion;
- (void)updateArtist:(Artist *)artist completion:(void(^)(Artist *))completion;
- (void)deleteArtist:(Artist *)artist completion:(void(^)(Artist *))completion;
- (void)getArtistWithcompletion:(NSString *)name completion:(void (^)(Artist *))completion;
- (void)getRelatedArtistsWithcompletion:(NSString *)name completion:(void (^)(NSArray *))completion;
@end
