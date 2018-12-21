//
//  Movies.m
//  Movies Objective C
//
//  Created by Greg Hughes on 12/20/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import "Movies.h"

@implementation Movies

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    
    if (self) {
    
        NSString *movieImage = dictionary[@"poster_path"];
        NSString *title = dictionary[@"title"];
        NSString *overview = dictionary[@"overview"];
        NSNumber *vote_average = dictionary[@"vote_average"];
        
        
        //Guards against an empty image URL
        if (movieImage == (id)[NSNull null] || movieImage.length == 0 ) movieImage = @" ";

        
        if (![title isKindOfClass:[NSString class]]
            || ! [overview isKindOfClass:[NSString class]]
            || ! [vote_average isKindOfClass:[NSNumber class]]
            || ! [movieImage isKindOfClass:[NSString class]]){
            
            return nil;
        }
        
        _title = title;
        _overview = overview;
        _rating = vote_average;
        _movieImage = movieImage;
        
    }
    return self;
}
@end
