//
//  Movies.h
//  Movies Objective C
//
//  Created by Greg Hughes on 12/20/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movies : NSObject

@property(nonatomic, copy, readonly) NSString *title;
@property(nonatomic, copy, readonly) NSString *overview;
@property(nonatomic, copy, readonly) NSNumber *rating;
@property(nonatomic, copy, readonly, nullable) NSString *movieImage;



-(instancetype) initWithDictionary: (NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
