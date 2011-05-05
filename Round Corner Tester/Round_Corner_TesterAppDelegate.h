//
//  Round_Corner_TesterAppDelegate.h
//  Round Corner Tester
//
//  Created by DX044 on 11-04-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface Round_Corner_TesterAppDelegate : NSObject <UIApplicationDelegate> {
  MainViewController *mainView_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
