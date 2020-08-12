//
//  AppDelegate.h
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 7/28/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

