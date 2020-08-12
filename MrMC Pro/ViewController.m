//
//  ViewController.m
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 7/28/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import "ViewController.h"
#import "MovieDetailView.h"
#import "TopTableViewPosterCell.h"
#import "AVKit/AVKit.h"

@implementation ViewController
- (void)viewDidLoad
{
  [super viewDidLoad];
  [self setImageTrait];
//  self.items = @[@"foo", @"bar",@"foo", @"bar",@"foo", @"bar",@"foo", @"bar",@"foo", @"bar",@"foo", @"bar"];
  [self.tableView registerNib:[UINib nibWithNibName:@"TableViewPosterCell" bundle:nil] forCellReuseIdentifier:@"TableViewPosterCell"];
  [self.tableView registerNib:[UINib nibWithNibName:@"TopTableViewPosterCell" bundle:nil] forCellReuseIdentifier:@"TopTableViewPosterCell"];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;

  self.parser = [ItemParser alloc];
  self.parser.delegate = self;
  [self.parser fetchRecentlyAdded];
}

- (void) traitCollectionDidChange: (UITraitCollection *) previousTraitCollection
{
  [super traitCollectionDidChange: previousTraitCollection];
  [self setImageTrait];
}

-(void) setImageTrait
{
  if(self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark)
  {
    self.logoImage.image = [UIImage imageNamed:@"Logo_dark.png"];
    self.SettingsButton.image = [UIImage imageNamed:@"SettingsDark.png"];
  }
  else
  {
    self.logoImage.image = [UIImage imageNamed:@"Logo_light.png"];
    self.SettingsButton.image = [UIImage imageNamed:@"SettingsLight.png"];
  }
}

#pragma UICollectionViewDataSource

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.row == 0)
    return 360;
  else
    return 540;
}

- (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath
{
  return false;
}

- (void)tableView:(UITableView *)tableView didUpdateFocusInContext:(UITableViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator
{
  NSIndexPath *nextIndexPath = [context nextFocusedIndexPath];

  if (nextIndexPath.row < 1)
  {
    if (self.logoImage.hidden == YES)
    {
      self.logoImage.alpha = 0;
      self.logoImage.hidden = NO;
      self.SettingsButton.alpha = 0;
      self.SettingsButton.hidden = NO;
      [UIView animateWithDuration:0.5 delay:0.3
                              options: UIViewAnimationOptionTransitionCrossDissolve
                           animations:^
                           {
                               self.logoImage.alpha = 1;
                               self.SettingsButton.alpha = 1;
                           }
                           completion:nil];
    }
  }
  else if (nextIndexPath.row > 1)
  {
    [UIView animateWithDuration:0.3 animations:^{
      self.logoImage.alpha = 0;
      self.SettingsButton.alpha = 0;
    } completion: ^(BOOL finished)
    {
      self.logoImage.hidden = finished;
      self.SettingsButton.hidden = finished;
    }];
  }
}

-(TableViewPosterCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  if (indexPath.row == 0)
  {
    static NSString *cellIdentifier = @"TopTableViewPosterCell";

    TopTableViewPosterCell *tv = (TopTableViewPosterCell*) [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    tv.tag = indexPath.row;
    tv.delegate = self;
    return (TableViewPosterCell *)tv;
  }
  else
  {
    static NSString *cellIdentifier = @"TableViewPosterCell";

    TableViewPosterCell *tv = (TableViewPosterCell*) [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    tv.tag = indexPath.row;
    tv.delegate = self;
    if (indexPath.row == 1)
    {
      tv.itemsArray = self.itemsDict[@"recentlyadded"][@"movies"];
      tv.catLabel.text = @"Recently Added Movies";
    }
    else
    {
      tv.itemsArray = self.itemsDict[@"recentlyadded"][@"episodes"];
      tv.catLabel.text = @"Recently Added TV Shows";
    }
    [tv reload];
    return tv;
  }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.itemsDict[@"recentlyadded"] count] + 1;
}

#pragma UICollectionViewDelegate

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

- (IBAction)SettingsAction:(TVPosterView *)sender
{
  NSLog(@"Selected Settings");
  [self.parser fetchRecentlyAdded];
}

- (void)tableViewCellClicked: (ItemDetail*) data
{
  NSLog(@"tableViewCellClicked:(NSString *)data");
  MovieDetailView *movieDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"MovieDetailView"];
  movieDetail.itemDetail = data;
  [self presentViewController:movieDetail animated:YES completion:nil];
}

-(void)topTableViewCellClicked: (NSInteger) tag
{
  NSLog(@"topTableViewCellClicked:(NSInteger) tag = %td", tag);
}

-(void)recentlyAddedDone: (NSDictionary*) data
{
  self.itemsDict = data;
  NSLog(@"recentlyAddedDone: (NSDictionary*) data");
  [self.tableView reloadData];
}

@end
