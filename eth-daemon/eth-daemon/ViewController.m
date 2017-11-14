//
//  ViewController.m
//  eth-daemon
//
//  Created by Alberto R. Estarrona on 12/11/17.
//  Copyright © 2017 Estarrona. All rights reserved.
//

#import "ViewController.h"
#import <Statusgo/Statusgo.h>

@interface ViewController ()

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

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)damenon:(id)sender {
    
    NSString* configString = @"{\"DevMode\": true,\"NetworkId\": 3,\"DataDir\": \"$TMPDIR\",\"KeyStoreDir\": \"$TMPDIR/keystore\",\"NodeKeyFile\": \"\",\"Name\": \"StatusIM\",\"Version\": \"$VERSION\",\"APIModules\": \"db,eth,net,web3,shh,personal,admin\",\"HTTPHost\": \"localhost\",\"RPCEnabled\": false,\"HTTPPort\": 8545,\"WSHost\": \"localhost\",\"WSPort\": 8546,\"WSEnabled\": false,\"IPCFile\": \"geth.ipc\",\"IPCEnabled\": false,\"TLSEnabled\": false,\"MaxPeers\": 25,\"MaxPendingPeers\": 0,\"LogFile\": \"\",\"LogLevel\": \"ERROR\",\"LogToStderr\": true,\"UpstreamConfig\": {\"Enabled\": false,\"URL\": \"https://ropsten.infura.io/nKmXgiFgc2KqtoQ8BCGJ\"},\"BootClusterConfig\": {\"Enabled\": true,\"RootNumber\": 395, \"RootHash\": \"673363514b866bbbaf1b94462203650e3b1a2d4fb498df33361458b465b61ca3\",\"BootNodes\": [\"enode://7ab298cedc4185a894d21d8a4615262ec6bdce66c9b6783878258e0d5b31013d30c9038932432f70e5b2b6a5cd323bf820554fcb22fbc7b45367889522e9c449@51.15.63.93:30303\", \"enode://f59e8701f18c79c5cbc7618dc7bb928d44dc2f5405c7d693dad97da2d8585975942ec6fd36d3fe608bfdc7270a34a4dd00f38cfe96b2baa24f7cd0ac28d382a1@51.15.79.88:30303\",\"enode://e2a3587b7b41acfc49eddea9229281905d252efba0baf565cf6276df17faf04801b7879eead757da8b5be13b05f25e775ab6d857ff264bc53a89c027a657dd10@51.15.45.114:30303\", \"enode://fe991752c4ceab8b90608fbf16d89a5f7d6d1825647d4981569ebcece1b243b2000420a5db721e214231c7a6da3543fa821185c706cbd9b9be651494ec97f56a@51.15.67.119:30303\", \"enode://482484b9198530ee2e00db89791823244ca41dcd372242e2e1297dd06f6d8dd357603960c5ad9cc8dc15fcdf0e4edd06b7ad7db590e67a0b54f798c26581ebd7@51.15.75.138:30303\", \"enode://9e99e183b5c71d51deb16e6b42ac9c26c75cfc95fff9dfae828b871b348354cbecf196dff4dd43567b26c8241b2b979cb4ea9f8dae2d9aacf86649dafe19a39a@51.15.79.176:30303\", \"enode://12d52c3796700fb5acff2c7d96df7bbb6d7109b67f3442ee3d99ac1c197016cddb4c3568bbeba05d39145c59c990cd64f76bc9b00d4b13f10095c49507dd4cf9@51.15.63.110:30303\", \"enode://0f7c65277f916ff4379fe520b875082a56e587eb3ce1c1567d9ff94206bdb05ba167c52272f20f634cd1ebdec5d9dfeb393018bfde1595d8e64a717c8b46692f@51.15.54.150:30303\", \"enode://e006f0b2dc98e757468b67173295519e9b6d5ff4842772acb18fd055c620727ab23766c95b8ee1008dea9e8ef61e83b1515ddb3fb56dbfb9dbf1f463552a7c9f@212.47.237.127:30303\", \"enode://d40871fc3e11b2649700978e06acd68a24af54e603d4333faecb70926ca7df93baa0b7bf4e927fcad9a7c1c07f9b325b22f6d1730e728314d0e4e6523e5cebc2@51.15.132.235:30303\", \"enode://ea37c9724762be7f668e15d3dc955562529ab4f01bd7951f0b3c1960b75ecba45e8c3bb3c8ebe6a7504d9a40dd99a562b13629cc8e5e12153451765f9a12a61d@163.172.189.205:30303\", \"enode://88c2b24429a6f7683fbfd06874ae3f1e7c8b4a5ffb846e77c705ba02e2543789d66fc032b6606a8d8888eb6239a2abe5897ce83f78dcdcfcb027d6ea69aa6fe9@163.172.157.61:30303\", \"enode://ce6854c2c77a8800fcc12600206c344b8053bb90ee3ba280e6c4f18f3141cdc5ee80bcc3bdb24cbc0e96dffd4b38d7b57546ed528c00af6cd604ab65c4d528f6@163.172.153.124:30303\", \"enode://00ae60771d9815daba35766d463a82a7b360b3a80e35ab2e0daa25bdc6ca6213ff4c8348025e7e1a908a8f58411a364fe02a0fb3c2aa32008304f063d8aaf1a2@163.172.132.85:30303\", \"enode://86ebc843aa51669e08e27400e435f957918e39dc540b021a2f3291ab776c88bbda3d97631639219b6e77e375ab7944222c47713bdeb3251b25779ce743a39d70@212.47.254.155:30303\", \"enode://a1ef9ba5550d5fac27f7cbd4e8d20a643ad75596f307c91cd6e7f85b548b8a6bf215cca436d6ee436d6135f9fe51398f8dd4c0bd6c6a0c332ccb41880f33ec12@51.15.218.125:30303\" ]}, \"LightEthConfig\": { \"Enabled\": true, \"Genesis\": \"{\"config\":{\"chainId\":3,\"homesteadBlock\":0,\"daoForkSupport\":true,\"eip150Block\":0,\"eip150Hash\":\"0x41941023680923e0fe4d74a34bdac8141f2540e3ae90623718e47d66d1ca4a2d\",\"eip155Block\":10,\"eip158Block\":10,\"metropolisBlock\":9223372036854775807,\"ethash\":{}},\"nonce\":\"0x42\",\"timestamp\":\"0x0\",\"extraData\":\"0x3535353535353535353535353535353535353535353535353535353535353535\",\"gasLimit\":\"0x1000000\",\"difficulty\":\"0x100000\",\"mixHash\":\"0x0000000000000000000000000000000000000000000000000000000000000000\",\"coinbase\":\"0x0000000000000000000000000000000000000000\",\"alloc\":{\"0000000000000000000000000000000000000000\":{\"balance\":\"0x1\"},\"0000000000000000000000000000000000000001\":{\"balance\":\"0x1\"},\"0000000000000000000000000000000000000002\":{\"balance\":\"0x1\"},\"0000000000000000000000000000000000000003\":{\"balance\":\"0x1\"},\"0000000000000000000000000000000000000004\":{\"balance\":\"0x1\"},\"0000000000000000000000000000000000000005\":{\"balance\":\"0x1\"},\"0000000000000000000000000000000000000006\":{\"balance\":\"0x1\"},\"0000000000000000000000000000000000000007\":{\"balance\":\"0x1\"},\"0000000000000000000000000000000000000008\":{\"balance\":\"0x1\"},\"0000000000000000000000000000000000000009\":{\"balance\":\"0x1\"},\"000000000000000000000000000000000000000a\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000000b\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000000c\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000000d\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000000e\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000000f\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000010\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000011\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000012\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000013\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000014\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000015\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000016\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000017\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000018\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000019\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000001a\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000001b\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000001c\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000001d\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000001e\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000001f\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000020\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000021\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000022\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000023\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000024\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000025\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000026\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000027\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000028\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000029\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000002a\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000002b\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000002c\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000002d\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000002e\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000002f\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000030\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000031\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000032\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000033\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000034\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000035\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000036\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000037\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000038\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000039\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000003a\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000003b\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000003c\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000003d\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000003e\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000003f\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000040\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000041\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000042\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000043\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000044\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000045\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000046\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000047\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000048\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000049\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000004a\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000004b\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000004c\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000004d\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000004e\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000004f\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000050\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000051\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000052\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000053\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000054\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000055\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000056\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000057\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000058\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000059\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000005a\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000005b\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000005c\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000005d\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000005e\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000005f\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000060\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000061\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000062\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000063\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000064\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000065\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000066\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000067\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000068\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000069\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000006a\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000006b\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000006c\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000006d\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000006e\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000006f\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000070\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000071\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000072\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000073\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000074\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000075\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000076\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000077\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000078\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000079\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000007a\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000007b\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000007c\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000007d\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000007e\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000007f\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000080\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000081\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000082\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000083\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000084\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000085\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000086\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000087\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000088\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000089\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000008a\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000008b\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000008c\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000008d\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000008e\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000008f\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000090\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000091\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000092\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000093\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000094\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000095\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000096\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000097\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000098\":{\"balance\":\"0x0\"},\"0000000000000000000000000000000000000099\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000009a\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000009b\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000009c\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000009d\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000009e\":{\"balance\":\"0x0\"},\"000000000000000000000000000000000000009f\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000a0\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000a1\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000a2\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000a3\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000a4\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000a5\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000a6\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000a7\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000a8\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000a9\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000aa\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ab\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ac\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ad\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ae\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000af\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000b0\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000b1\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000b2\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000b3\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000b4\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000b5\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000b6\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000b7\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000b8\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000b9\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ba\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000bb\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000bc\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000bd\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000be\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000bf\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000c0\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000c1\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000c2\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000c3\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000c4\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000c5\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000c6\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000c7\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000c8\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000c9\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ca\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000cb\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000cc\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000cd\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ce\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000cf\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000d0\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000d1\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000d2\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000d3\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000d4\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000d5\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000d6\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000d7\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000d8\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000d9\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000da\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000db\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000dc\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000dd\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000de\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000df\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000e0\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000e1\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000e2\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000e3\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000e4\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000e5\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000e6\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000e7\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000e8\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000e9\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ea\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000eb\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ec\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ed\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ee\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ef\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000f0\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000f1\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000f2\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000f3\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000f4\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000f5\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000f6\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000f7\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000f8\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000f9\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000fa\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000fb\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000fc\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000fd\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000fe\":{\"balance\":\"0x0\"},\"00000000000000000000000000000000000000ff\":{\"balance\":\"0x0\"},\"874b54a8bd152966d63f706bae1ffeb0411921e5\":{\"balance\":\"0xc9f2c9cd04674edea40000000\"}},\"number\":0,\"gasUsed\":\"0x0\",\"parentHash\":\"0x0000000000000000000000000000000000000000000000000000000000000000\"}\", \"DatabaseCache\": 16 }, \"WhisperConfig\": { \"Enabled\": true, \"IdentityFile\": \"\", \"PasswordFile\": \"\", \"EchoMode\": false, \"BootstrapNode\": false, \"ForwarderNode\": false, \"MailServerNode\": false, \"NotificationServerNode\": false, \"DataDir\": \"$TMPDIR/wnode\", \"Port\": 30379, \"MinimumPoW\": 0.001, \"TTL\": 120, \"FirebaseConfig\": {  \"AuthorizationKeyFile\": \"\", \"NotificationTriggerURL\": \"https://fcm.googleapis.com/fcm/send\" } }, \"SwarmConfig\": { \"Enabled\": false } }";
    //=============
   
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
    
    NSLog(@"preconfig: %@", configString);
    NSLog(@"preconfig: %@", json_config);
    NSData *configData = [configString dataUsingEncoding:NSUTF8StringEncoding];
    //NSDictionary *configJSON = [NSJSONSerialization JSONObjectWithData:configData options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *configJSON = json_config;

    int networkId = [configJSON[@"NetworkId"] integerValue];
    NSString *dataDir = [configJSON objectForKey:@"DataDir"];
    NSString *upstreamURL = [configJSON valueForKeyPath:@"UpstreamConfig.URL"];
    NSString *networkDir = [rootUrl.path stringByAppendingString:dataDir];
    //NSString *devCluster = [ReactNativeConfig envFor:@"ETHEREUM_DEV_CLUSTER"];
    int dev = 0;
//    if([devCluster isEqualToString:@"1"]){
//        dev = 1;
//    }
    char *configChars = GenerateConfig((char *)[networkDir UTF8String], networkId, dev);
    NSString *config = [NSString stringWithUTF8String: configChars];
    configData = [config dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *resultingConfigJson = [NSJSONSerialization JSONObjectWithData:configData options:NSJSONReadingMutableContainers error:nil];
    [resultingConfigJson setValue:newKeystoreUrl.path forKey:@"KeyStoreDir"];
    [resultingConfigJson setValue:[NSNumber numberWithBool:YES] forKey:@"LogEnabled"];
    [resultingConfigJson setValue:@"geth.log" forKey:@"LogFile"];
    [resultingConfigJson setValue:@"DEBUG" forKey:@"LogLevel"];
    
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

@end
