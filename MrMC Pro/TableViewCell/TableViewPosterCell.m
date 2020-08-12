//
//  UICollectionViewCell+TableViewCell.m
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 8/2/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import "TableViewPosterCell.h"
#import "ItemDetail.h"
#import "Poster.h"


@implementation TableViewPosterCell

- (void)awakeFromNib
{
  [super awakeFromNib];
  [self.category registerNib:[UINib nibWithNibName:@"Poster" bundle:nil] forCellWithReuseIdentifier:@"Poster"];
  [self.category registerNib:[UINib nibWithNibName:@"Fanart" bundle:nil] forCellWithReuseIdentifier:@"Fanart"];
  self.category.delegate = self;
  self.category.dataSource = self;
  self.category.showsHorizontalScrollIndicator = false;
//  [self.category reloadData];
}

-(void) reload
{
  [self.category reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return [self.itemsArray count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfRowsInSection:(NSInteger)section
{
  return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  if (self.tag == 1)
    return CGSizeMake(595,380);
  else
    return CGSizeMake(262,420);
}

-(Poster*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  NSInteger row = indexPath.row;
  NSDictionary *item = self.itemsArray[row];
  static NSString *cellIdentifier = @"Poster";
  Poster *cell = (Poster*) [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
  cell.itemDetail.progress = [item[@"progress"] floatValue];
  cell.itemDetail.fanart = item[@"fanart"];
  cell.itemDetail.poster = item[@"poster"];
  cell.itemDetail.name = item[@"name"];
  cell.itemDetail.plot = item[@"plot"];
  cell.itemDetail.url = item[@"url"];

  if (self.tag == 1)
    cell.itemDetail.isMovieRA = true;
  else
    cell.itemDetail.isMovieRA = false;

  [cell loadInfo];
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didUpdateFocusInContext:(UICollectionViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator
{
//  NSInteger test = context.nextFocusedIndexPath;

  Poster *cell = (Poster*) context.nextFocusedView;
//  cell.homePosterItem.title = cell.itemDetail.name;
  NSString *text = @"testing";
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSInteger test = self.tag;
  NSString *text = @"testing";
  Poster *cell = (Poster*) [collectionView cellForItemAtIndexPath:indexPath];;

  [self.delegate tableViewCellClicked:cell.itemDetail];
}

@end
