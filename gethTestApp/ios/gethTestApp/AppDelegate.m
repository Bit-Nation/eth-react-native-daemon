/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <Geth/Geth.objc.h>

@implementation AppDelegate
RCT_EXPORT_MODULE()

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSURL *jsCodeLocation;

  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"gethTestApp"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  return YES;
}

RCT_EXPORT_METHOD(startDaemon){
  [self startDaemonFromReact];
}

RCT_EXPORT_METHOD(stopDaemon){
  [self stopDaemonFromReact];
}

- (void)startDaemonFromReact {
  GethNodeConfig *configGeth;
  NSError *error = nil;
  
  configGeth = GethNewNodeConfig();
  [configGeth setEthereumEnabled:true];
  [configGeth setEthereumNetworkID:3];
  
  GethEnodes *enodes = GethNewEnodes(16);
  enodes = GethFoundationBootnodes();
  
  [configGeth setBootstrapNodes:enodes];
  //NSString *genesis = GethMainnetGenesis();
  NSString *genesis = GethTestnetGenesis();
  [configGeth setEthereumGenesis: genesis];
  [configGeth  setMaxPeers: 25];
  [configGeth setWhisperEnabled: NO];
  
  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSURL *rootUrl =[[fileManager
                    URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]
                   lastObject];
  NSURL *testnetFolderName = [rootUrl URLByAppendingPathComponent:@"ethereum/testnet"];
  
  if (![fileManager fileExistsAtPath:testnetFolderName.path])
    [fileManager createDirectoryAtPath:testnetFolderName.path withIntermediateDirectories:YES attributes:nil error:&error];
  
  NSString *networkDir = [rootUrl.path stringByAppendingString:@"/$TMPDIR"];
  
  node = GethNewNode(networkDir, configGeth, &error);
  
  GethSetVerbosity(9);
  
  [node start:&error];
  
  //EthClient = [node getEthereumClient:&error];
  //EthClient = GethNewEthereumClient(@"http://localhost:8545", &error);
  //NSLog(@"EthCient, %@", EthClient);
}

- (void)stopDaemonFromReact {
  NSError *error = nil;
  
  [node stop:&error];
}

@end
