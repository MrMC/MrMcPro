//
//  UICollectionViewCell+TableViewCell.h
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 8/2/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>
#import "ItemDetail.h"

//NS_ASSUME_NONNULL_BEGIN

@protocol TableViewPosterCellProtocol
@required
-(void)tableViewCellClicked: (ItemDetail*) data;
@end

@interface TableViewPosterCell:UITableViewCell<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *category;
@property (weak, nonatomic) IBOutlet UILabel *catLabel;
@property (nonatomic, weak) id <TableViewPosterCellProtocol> delegate;
@property (strong, nonatomic) NSArray *itemsArray;
-(void) reload;
@end



//NS_ASSUME_NONNULL_END
