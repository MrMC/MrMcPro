//
//  UICollectionViewCell+TableViewCell.m
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 8/2/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import "TopTableViewPosterCell.h"
#import "ViewController.h"
#import "HomeButton.h"

@interface TopTableViewPosterCell()

//@property (nonatomic, weak) id <ViewController> delegate;

@end

@implementation TopTableViewPosterCell

- (void)awakeFromNib
{
  [super awakeFromNib];
  self.items = @[@"Movies", @"TV Shows",@"Music", @"Live TV"];
  [self.category registerNib:[UINib nibWithNibName:@"HomeButton" bundle:nil] forCellWithReuseIdentifier:@"HomeButton"];
  self.category.delegate = self;
  self.category.dataSource = self;
  self.category.showsHorizontalScrollIndicator = false;
  [self.category reloadData];
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
  // Add inset to the collection view if there are not enough cells to fill the width.
  CGFloat cellSpacing = ((UICollectionViewFlowLayout *) collectionViewLayout).minimumLineSpacing;
  CGFloat cellWidth = ((UICollectionViewFlowLayout *) collectionViewLayout).itemSize.width;
  NSInteger cellCount = [collectionView numberOfItemsInSection:section];
  CGFloat inset = (collectionView.bounds.size.width - (cellCount * cellWidth) - ((cellCount - 1)*cellSpacing)) * 0.5;
  inset = MAX(inset, 0.0);
  return UIEdgeInsetsMake(0.0, inset-80, 0.0, 0.0);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfRowsInSection:(NSInteger)section
{
  return 1;
}

-(HomeButton*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

  static NSString *cellIdentifier = @"HomeButton";

  HomeButton *cell = (HomeButton*) [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
  cell.homeItem.image = [UIImage imageNamed:@"MainMenuFO.png"];
  cell.homeItem.title = [self.items objectAtIndex:indexPath.row];
  cell.homeItemCategoryImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li.png", (long)indexPath.row]];
  cell.homeItemCategoryImage.layer.position = CGPointMake(140,80);
  [cell.homeItem.imageView.overlayContentView addSubview:cell.homeItemCategoryImage];
  cell.homeItem.imageView.adjustsImageWhenAncestorFocused = YES;
  cell.homeItem.imageView.clipsToBounds = NO;
  cell.possition = indexPath.row;
  return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  // [self performSegueWithIdentifier:@"playMovies" sender:self];

  NSInteger test = self.tag;
  NSString *text = @"testing";
  HomeButton *cell = (HomeButton*) [collectionView cellForItemAtIndexPath:indexPath];
  [self.delegate topTableViewCellClicked:cell.possition];

}

@end
