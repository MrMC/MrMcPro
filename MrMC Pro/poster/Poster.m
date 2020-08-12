//
//  UICollectionViewCell+HomeItem.m
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 7/28/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import "Poster.h"

@implementation Poster

- (void)awakeFromNib
{
  [super awakeFromNib];
  self.homePosterItem.clipsToBounds = false;
  self.layer.masksToBounds = false;
  self.itemDetail = [ItemDetail alloc];
}

- (void)loadInfo
{
  UIImage *img;
  UIProgressView *progressView;
  if (self.itemDetail.isMovieRA)
  {
    img = [UIImage imageNamed:self.itemDetail.fanart];
    progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0,0,470,10)];
    progressView.layer.position = CGPointMake(260,280);
  }
  else
  {
    img = [UIImage imageNamed:self.itemDetail.poster];
    progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0,0,192,10)];
    progressView.layer.position = CGPointMake(107,290);
  }
  self.homePosterItem.image = img;
  self.homePosterItem.title = self.itemDetail.name;
  progressView.overrideUserInterfaceStyle = UIProgressViewStyleDefault;
  progressView.progress = self.itemDetail.progress / 100.0f;
  progressView.trackTintColor = [UIColor whiteColor];
  progressView.progressTintColor = [UIColor darkGrayColor];
  [self.homePosterItem.imageView.overlayContentView addSubview:progressView];
  self.homePosterItem.imageView.adjustsImageWhenAncestorFocused = YES;
  self.homePosterItem.imageView.clipsToBounds = NO;
}

@end
