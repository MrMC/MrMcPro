//
//  MovieDetailedItem.h
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 8/9/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import <CoreData/NSManagedObjectContext.h>

#ifndef ItemDetail_h
#define ItemDetail_h
@interface ItemDetail:NSObject
@property (nonatomic) NSString* url;
@property (nonatomic) NSString* name;
@property (nonatomic) NSString* plot;
@property (nonatomic) NSString* poster;
@property (nonatomic) NSString* fanart;
@property (nonatomic) float     progress;
@property (nonatomic) BOOL      isMovieRA;
@end

#endif /* MovieDetailedItem_h */
