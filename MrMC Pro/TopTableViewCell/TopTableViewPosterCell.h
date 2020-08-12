//
//  UICollectionViewCell+TableViewCell.h
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 8/2/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>

//NS_ASSUME_NONNULL_BEGIN

@protocol TopTableViewPosterCellProtocol
@required
-(void)topTableViewCellClicked: (NSInteger) tag;
@end

@interface TopTableViewPosterCell:UITableViewCell<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *category;
@property (nonatomic, weak) id <TopTableViewPosterCellProtocol> delegate;
@property (strong, nonatomic) NSArray *items;
@end

//NS_ASSUME_NONNULL_END
