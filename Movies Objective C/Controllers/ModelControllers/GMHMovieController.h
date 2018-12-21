//
//  GMHMovieController.h
//  Movies Objective C
//
//  Created by Greg Hughes on 12/20/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movies.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface GMHMovieController : NSObject

+(void) fetchMovies:(NSString *)movies
                            withCompletion:(void (^) (NSArray<Movies *> * _Nullable movies)) completion;

+(void) fetchMovieImages: (Movies *) movie
          withCompletion: (void (^) (UIImage * _Nullable)) completion;








@end

NS_ASSUME_NONNULL_END
