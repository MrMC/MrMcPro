//
//  UICollectionViewCell+HomeButton.h
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 8/7/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>
#import <TVUIKit/TVUIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeButton : UICollectionViewCell

@property (weak, nonatomic) IBOutlet TVPosterView *homeItem;
@property (weak, nonatomic) IBOutlet UIImageView *homeItemCategoryImage;
@property (nonatomic) NSInteger possition;

@end

NS_ASSUME_NONNULL_END
