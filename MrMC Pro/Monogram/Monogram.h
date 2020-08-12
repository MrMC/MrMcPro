//
//  UITableViewCell+Monogram.h
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 8/11/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TVUIKit/TVUIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Monogram:UICollectionViewCell
@property (weak, nonatomic) IBOutlet TVMonogramView *actorMonogram;

@end

NS_ASSUME_NONNULL_END
