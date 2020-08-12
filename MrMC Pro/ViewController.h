//
//  ViewController.h
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 7/28/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TVUIKit/TVUIKit.h>
#import "ItemParser.h"
#import "MovieDetailView.h"
#import "TableViewPosterCell.h"
#import "TopTableViewPosterCell.h"


@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,TableViewPosterCellProtocol,TopTableViewPosterCellProtocol,ItemParserCallBack>
@property (weak, nonatomic) IBOutlet TVPosterView *SettingsButton;
- (IBAction)SettingsAction:(TVPosterView *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
//@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) NSDictionary *itemsDict;
@property (strong, nonatomic) ItemParser *parser;
@end

