//
//  GMHMovieController.m
//  Movies Objective C
//
//  Created by Greg Hughes on 12/20/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import "GMHMovieController.h"
#import "Movies.h"
@implementation GMHMovieController

// MARK: - Base Movie URL
+(NSURL *)baseUrl
{
   return [NSURL URLWithString:@"https://api.themoviedb.org/3/search/movie?api_key=7f5f4e6a07db6fb0937476aa3b1f48f1"];
}


// MARK: - Fetch Movies
+ (void)fetchMovies:(NSString *)movies withCompletion:(void (^)(NSArray<Movies *> * _Nullable))completion
{
    
    NSURLQueryItem *searchQueryItem = [[NSURLQueryItem alloc] initWithName:@"query" value:movies];
    NSURLQueryItem *searchQueryItem2 = [[NSURLQueryItem alloc] initWithName:@"api_key" value:@"7f5f4e6a07db6fb0937476aa3b1f48f1"];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL: [self baseUrl] resolvingAgainstBaseURL:YES];
    
    [urlComponents setQueryItems:@[searchQueryItem2,searchQueryItem]];
    
    NSURL *moviesUrl = urlComponents.URL;
    
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:moviesUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error) {
            NSLog(@"There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"unable to retrieve data");
            completion(nil);
            return;
        }
        
        
        NSDictionary *movieDictionary = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error: &error];
        
        NSArray *resultsArray = movieDictionary[@"results"];
        
        NSMutableArray *movieArray = [NSMutableArray new];
        
        
        for (NSDictionary *moviesDictionary in resultsArray) {
            
            
            Movies *movie = [[Movies alloc] initWithDictionary:moviesDictionary];
            
            [movieArray addObject:movie];
        }
        completion(movieArray);
    }]resume];
}





// MARK: - Base Image URL
+(NSURL *)baseImageUrl
{
    return [NSURL URLWithString:@"https://image.tmdb.org/t/p/original"];
}


// MARK: - Fetch Movie Images
+ (void)fetchMovieImages:(Movies *)movie withCompletion:(void (^)(UIImage * _Nullable))completion
{
    
    
    NSURL *imageUrl = [[GMHMovieController baseImageUrl] URLByAppendingPathComponent: movie.movieImage];
    
    
    if (!imageUrl) {
        NSLog(@"no url for image");
        completion(nil);
        return;
    }
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL: imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error)
        {
            NSLog(@"There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        
        
        if (!data)
        {
            NSLog(@"no data was retrieved");
            completion(nil);
            return;
        }
        
        
        UIImage *image = [UIImage  imageWithData:data];
        
        
        if (image)
        {
            completion(image);
        }
        else
        {
            completion(nil);
        }
        
    }]resume];
}
@end
