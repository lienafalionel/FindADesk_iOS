//
//  ArtistService.m
//  DeezCovery
//
//  Created by ESGI on 11/02/2015.
//  Copyright (c) 2015 MLM. All rights reserved.
//

#import "ArtistService.h"
#import "SessionManager.h"
#import "Artist+JSONSerializer.h"

@implementation ArtistService
static ArtistService *sharedInstance = nil;

#pragma mark - Singleton Pattern -
+ (instancetype)sharedInstance{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if(sharedInstance == nil)
            sharedInstance = [[super allocWithZone:NULL] init];
    });
    return sharedInstance;
}
+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}
- (id)copyWithZone:(NSZone *)zone{
    return self;
}
- (id)init{
    if(nil != (self = [super init]))
    {}
    return self;
}

- (void)createArtist:(Artist *)artist completion:(void (^)(Artist *))completion{
    [[SessionManager sharedInstance] POST:@"/artist" data:@{@"artist" : artist.toJSON} completion:^(NSDictionary *JSON) {
        Artist *createdArtist = [Artist artistFromJSON:JSON];
        if(completion) completion(createdArtist);
    }];
}

- (void)updateArtist:(Artist *)artist completion:(void (^)(Artist *))completion{
    [[SessionManager sharedInstance] PUT:@"/artist" data:@{@"artist" : artist.toJSON} completion:^(NSDictionary *JSON) {
        Artist *updatedArtist = [Artist artistFromJSON:JSON];
        if (completion) completion(updatedArtist);
    }];
}

- (void)deleteArtist:(Artist *)artist completion:(void (^)(Artist *))completion{
    NSString *url = [NSString stringWithFormat:@"/artist/%@", artist.id];
    [[SessionManager sharedInstance] DELETE:url data:nil completion:^(NSDictionary *JSON){
        Artist *deletedArtist = [Artist artistFromJSON:JSON];
        if (completion) completion(deletedArtist);
    }];}

- (void)getArtistWithcompletion:(NSString *)name completion:(void (^)(Artist *))completion {
    NSString *url = [NSString stringWithFormat:@"/artist/%@", name];
    [[SessionManager sharedInstance] GET:url completion:^(NSDictionary * JSON) {
        Artist *artist = [Artist artistFromJSON:JSON];
        if(completion) completion(artist);
    }];
}

- (void)getRelatedArtistsWithcompletion:(NSString *)name completion:(void (^)(NSArray *))completion{
    [self getArtistWithcompletion:name completion:^(Artist *artist) {
        NSString *url = [NSString stringWithFormat:@"/artist/%@/related", artist.id];
        [[SessionManager sharedInstance] LIST:url completion:^(NSArray * JSON) {
            NSArray *data = [JSON valueForKey:@"data"];
            NSMutableArray *relatedArtists = [@[] mutableCopy];
            for (NSDictionary *object in data){
                Artist *artist = [Artist artistFromJSON:object];
                [relatedArtists addObject:artist];
            }
            if (completion) completion(relatedArtists);
        }];
    }];
}

@end