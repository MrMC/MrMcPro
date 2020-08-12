//
//  UICollectionViewCell+HomeItem.h
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 7/28/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>
#import <TVUIKit/TVUIKit.h>
#import "ItemDetail.h"


@interface Poster : UICollectionViewCell
@property (weak, nonatomic) IBOutlet TVPosterView *homePosterItem;
@property (strong, nonatomic) ItemDetail* itemDetail;
- (void)loadInfo;
@end

