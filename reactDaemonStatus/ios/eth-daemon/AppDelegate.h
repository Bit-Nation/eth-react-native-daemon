//
//  AppDelegate.h
//  eth-daemon
//
//  Created by Alberto R. Estarrona on 12/11/17.
//  Copyright © 2017 Estarrona. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTRootView.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, RCTBridgeModule>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RCTRootView *rootView;

@end

