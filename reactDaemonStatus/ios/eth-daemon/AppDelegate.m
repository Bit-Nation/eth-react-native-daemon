//
//  AppDelegate.m
//  eth-daemon
//
//  Created by Alberto R. Estarrona on 12/11/17.
//  Copyright © 2017 Estarrona. All rights reserved.
//

#import "AppDelegate.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <Statusgo/Statusgo.h>

@interface AppDelegate ()

@end

@interface NSDictionary (BVJSONString)
-(NSString*) bv_jsonStringWithPrettyPrint:(BOOL) prettyPrint;
@end

@implementation NSDictionary (BVJSONString)

-(NSString*) bv_jsonStringWithPrettyPrint:(BOOL) prettyPrint {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:(NSJSONWritingOptions)    (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"bv_jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}
@end


@implementation AppDelegate
RCT_EXPORT_MODULE()

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
/*    NSURL *jsCodeLocation;
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil]; */
    
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://192.168.0.3:8081/index.bundle?platform=ios"];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"Daemon"
                                                 initialProperties:nil
                                                     launchOptions:nil];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *rootViewController = [UIViewController new];
    rootViewController.view = rootView;
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}

RCT_EXPORT_METHOD(startDaemon){
    [self startDaemonFromReact];
}

RCT_EXPORT_METHOD(stopDaemon){
    [self stopDaemonFromReact];
}

- (void)startDaemonFromReact {
    
#if DEBUG
    NSLog(@"StartNode() method called");
#endif
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    NSURL *rootUrl =[[fileManager
                      URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]
                     lastObject];
    NSURL *testnetFolderName = [rootUrl URLByAppendingPathComponent:@"ethereum/testnet"];
    
    if (![fileManager fileExistsAtPath:testnetFolderName.path])
        [fileManager createDirectoryAtPath:testnetFolderName.path withIntermediateDirectories:YES attributes:nil error:&error];
    
    NSURL *flagFolderUrl = [rootUrl URLByAppendingPathComponent:@"ropsten_flag"];
    
    if(![fileManager fileExistsAtPath:flagFolderUrl.path]){
        NSLog(@"remove lightchaindata");
        NSURL *lightChainData = [testnetFolderName URLByAppendingPathComponent:@"StatusIM/lightchaindata"];
        if([fileManager fileExistsAtPath:lightChainData.path]) {
            [fileManager removeItemAtPath:lightChainData.path
                                    error:nil];
        }
        [fileManager createDirectoryAtPath:flagFolderUrl.path
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:&error];
    }
    
    NSLog(@"after remove lightchaindata");
    
    NSURL *oldKeystoreUrl = [testnetFolderName URLByAppendingPathComponent:@"keystore"];
    NSURL *newKeystoreUrl = [rootUrl URLByAppendingPathComponent:@"keystore"];
    if([fileManager fileExistsAtPath:oldKeystoreUrl.path]){
        NSLog(@"copy keystore");
        [fileManager copyItemAtPath:oldKeystoreUrl.path toPath:newKeystoreUrl.path error:nil];
        [fileManager removeItemAtPath:oldKeystoreUrl.path error:nil];
    }
    
    NSLog(@"after lightChainData");
    
    //Temp JSON for testing
    NSMutableDictionary *json_config = [[NSMutableDictionary alloc]init];
    [json_config setValue:@3 forKey:@"NetworkId"];
    [json_config setValue:@"/$TMPDIR" forKey:@"DataDir"];
    NSMutableDictionary *json_upstream = [[NSMutableDictionary alloc]init];
    [json_upstream setValue:@NO forKey:@"Enabled"];
    [json_upstream setValue:@"https://ropsten.infura.io/nKmXgiFgc2KqtoQ8BCGJ" forKey:@"URL"];
    [json_config setObject:json_upstream forKey:@"UpstreamConfig"];
    // End JSON testing
    
    NSLog(@"preconfig: %@", json_config);
    
    NSData *configData;
    NSDictionary *configJSON = json_config;
    
    int networkId = [configJSON[@"NetworkId"] integerValue];
    NSString *dataDir = [configJSON objectForKey:@"DataDir"];
    NSString *upstreamURL = [configJSON valueForKeyPath:@"UpstreamConfig.URL"];
    NSString *networkDir = [rootUrl.path stringByAppendingString:dataDir];
    //NSString *devCluster = [ReactNativeConfig envFor:@"ETHEREUM_DEV_CLUSTER"];
     
    int dev = 1;
    //    if([devCluster isEqualToString:@"1"]){
    //        dev = 1;
    //    }
    char *configChars = GenerateConfig((char *)[networkDir UTF8String], networkId, dev);
    NSString *config = [NSString stringWithUTF8String: configChars];
    
    NSLog(@"preconfig: %@", config);
    
    configData = [config dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *resultingConfigJson = [NSJSONSerialization JSONObjectWithData:configData options:NSJSONReadingMutableContainers error:nil];
    [resultingConfigJson setValue:newKeystoreUrl.path forKey:@"KeyStoreDir"];
    [resultingConfigJson setValue:[NSNumber numberWithBool:YES] forKey:@"LogEnabled"];
    [resultingConfigJson setValue:@"geth.log" forKey:@"LogFile"];
    [resultingConfigJson setValue:@"DEBUG" forKey:@"LogLevel"];
    //Changes for localserver up
    [resultingConfigJson setValue:@YES forKey:@"IPCEnabled"];
    [resultingConfigJson setValue:@"BitnationTest" forKey:@"Name"];
    [resultingConfigJson setValue:@YES forKey:@"RPCEnabled"];
    
    if(upstreamURL != nil) {
        [resultingConfigJson setValue:[NSNumber numberWithBool:YES] forKeyPath:@"UpstreamConfig.Enabled"];
        [resultingConfigJson setValue:upstreamURL forKeyPath:@"UpstreamConfig.URL"];
    }
    NSString *resultingConfig = [resultingConfigJson bv_jsonStringWithPrettyPrint:NO];
    NSLog(@"node config %@", resultingConfig);
    NSURL *networkDirUrl = [NSURL fileURLWithPath:networkDir];
    NSURL *logUrl = [networkDirUrl URLByAppendingPathComponent:@"geth.log"];
    if([fileManager fileExistsAtPath:logUrl.path]) {
        [fileManager removeItemAtPath:logUrl.path error:nil];
    }
    
    if(![fileManager fileExistsAtPath:networkDirUrl.path]) {
        [fileManager createDirectoryAtPath:networkDirUrl.path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSLog(@"logUrlPath %@", logUrl.path);
    if(![fileManager fileExistsAtPath:logUrl.path]) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:[NSNumber numberWithInt:511] forKey:NSFilePosixPermissions];
        [fileManager createFileAtPath:logUrl.path contents:nil attributes:dict];
    }
#ifndef DEBUG
    [Instabug addFileAttachmentWithURL:logUrl];
#endif
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^(void)
                   {
                       char *res = StartNode((char *) [resultingConfig UTF8String]);
                       NSLog(@"StartNode result %@", [NSString stringWithUTF8String: res]);
                   });
}

- (void)stopDaemonFromReact {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^(void)
                   {
                       char *res = StopNode();
                       NSLog(@"StartNode result %@", [NSString stringWithUTF8String: res]);
                   });
}

@end
