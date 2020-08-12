//
//  UIViewController+MovieDetailView.m
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 8/11/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import "MovieDetailView.h"
#import "AVKit/AVKit.h"
#import "Monogram.h"

@implementation MovieDetailView
- (void)viewDidLoad
{
  [super viewDidLoad];

  self.focusGuide = [UIFocusGuide new];
  [self.actorCollectionView addLayoutGuide:self.focusGuide];
  [self.playButton addLayoutGuide:self.focusGuide];
//  [self.focusGuide setFra layoutFrame =
  [self.focusGuide.leftAnchor constraintEqualToAnchor:self.plot.leftAnchor].active = YES;
  [self.focusGuide.rightAnchor constraintEqualToAnchor:self.plot.rightAnchor].active = YES;
  [self.focusGuide.topAnchor constraintEqualToAnchor:self.plot.topAnchor].active = YES;
  [self.focusGuide.bottomAnchor constraintEqualToAnchor:self.plot.bottomAnchor].active = YES;
  // select the default focusable view
  self.focusGuide.preferredFocusEnvironments = @[self.actorCollectionView];

  self.poster.image = [UIImage imageNamed:self.itemDetail.poster];
  self.titleLabel.text = self.itemDetail.name;
  self.year.text = @"1978";
  self.plot.text = self.itemDetail.plot;

  [self.actorCollectionView registerNib:[UINib nibWithNibName:@"Monogram" bundle:nil] forCellWithReuseIdentifier:@"Monogram"];
  self.actorCollectionView.delegate = self;
  self.actorCollectionView.dataSource = self;
  self.actorCollectionView.showsHorizontalScrollIndicator = false;
  self.actorCollectionView.remembersLastFocusedIndexPath = true;
  [self.actorCollectionView reloadData];
}

// Update the preferred focus view when focus happen
- (void)didUpdateFocusInContext:(UIFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator
{
    if([context.nextFocusedView isKindOfClass:[Monogram class]])
    {
      self.focusGuide.preferredFocusEnvironments = @[self.playButton];
    }

    if(context.nextFocusedView == self.playButton)
    {
      self.focusGuide.preferredFocusEnvironments = @[self.actorCollectionView];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfRowsInSection:(NSInteger)section
{
  return 1;
}

-(Monogram*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

  static NSString *cellIdentifier = @"Monogram";

  Monogram *cell = (Monogram*) [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
  NSPersonNameComponents *personNameComponents = [NSPersonNameComponents new];
  personNameComponents.givenName = @"Adam";
  personNameComponents.familyName = @"Sandler";
  cell.actorMonogram.personNameComponents = personNameComponents;
//  cell.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  cell.actorMonogram.title = @"Adam Sandler";
  cell.actorMonogram.subtitle = @"Bobby Boucher";

  return cell;
}

- (IBAction)playAction:(UIButton *)sender
{
  [self playVideo:self.itemDetail];
}

-(void)playVideo: (ItemDetail *)data
{
  NSURL *videoURL = [NSURL URLWithString:data.url];

  AVPlayer *player = [AVPlayer playerWithURL:videoURL];
//  AVPlayerViewController *playerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AVPlayer"];
  AVPlayerViewController *playerViewController = [AVPlayerViewController new];
  playerViewController.player = player;
  playerViewController.showsPlaybackControls = YES;
  [self presentViewController:playerViewController animated:YES completion:^{
    [playerViewController.player play];
  }];
}
@end
