//
//  ItemParser.m
//  MrMC Pro
//
//  Created by Zeljko Ametovic on 8/10/20.
//  Copyright © 2020 Zeljko Ametovic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemParser.h"

@implementation ItemParser

- (void)fetchRecentlyAdded
{
  NSString *path = [[NSBundle mainBundle] pathForResource:@"response" ofType:@"json"];
  NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
  NSData *jsonData = [content dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error;

  NSDictionary *jsonDictionary;
  //    Note that JSONObjectWithData will return either an NSDictionary or an NSArray, depending whether your JSON string represents an a dictionary or an array.
  id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];

  if (error) {
      NSLog(@"Error parsing JSON: %@", error);
  }
  else
  {

        NSLog(@"it is a dictionary");
        jsonDictionary = (NSDictionary *)jsonObject;
//        NSInteger size = [jsonDictionary count];
//        NSInteger size1 = [jsonDictionary[@"recentlyadded"] count];
//        NSLog(@"jsonDictionary - %@",jsonDictionary);
  }
  [self.delegate recentlyAddedDone:jsonDictionary];
}

@end
