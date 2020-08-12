//
//  UICollectionViewCell+HomeButton.m
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 8/7/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import "HomeButton.h"

//#import <AppKit/AppKit.h>


@implementation HomeButton
- (void)awakeFromNib
{
  [super awakeFromNib];
  self.layer.masksToBounds = false;
}
@end
