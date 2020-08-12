//
//  ItemParser.h
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 8/10/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import <CoreData/NSManagedObjectContext.h>

#ifndef ItemParser_h
#define ItemParser_h

@protocol ItemParserCallBack
@required
-(void)recentlyAddedDone: (NSDictionary*) data;
@end

@interface ItemParser:NSObject
- (void)fetchRecentlyAdded;
@property (nonatomic, weak) id <ItemParserCallBack> delegate;
@end

#endif /* ItemParser_h */
