//
//  UIViewController+MovieDetailView.h
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 8/11/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import "ItemDetail.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetailView: UIViewController<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
- (IBAction)playAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *poster;
@property (weak, nonatomic) IBOutlet UILabel *parantalRating;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *year;
@property (weak, nonatomic) IBOutlet UITextView *plot;
@property (weak, nonatomic) IBOutlet UICollectionView *actorCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) ItemDetail* itemDetail;
@property (strong, nonatomic) UIFocusGuide *focusGuide;
@end

NS_ASSUME_NONNULL_END
