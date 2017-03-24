//
//  ViewController.m
//  加密解密Demo
//
//  Created by asl on 16/10/24.
//  Copyright © 2016年 Invisionhealth Digital Inc. All rights reserved.
//

#import "ViewController.h"
#import "GTMBase64.h"
#import "AESCrypt.h"
#import "NSData+AES256.h"
#import "NSString+AES256.h"
#import "DES3Util.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    //    NSString *documentsDirectory = [paths objectAtIndex:0];
    //    NSLog(@"%@", documentsDirectory);
    
    
#warning mark --
#warning mark DES加密解密
//******************🍎********************DES加密加密*********************🍎********************
//     NSString *jiami = [DES3Util encryptUseDES:@"123=DES加密加密" key:@"des"];
//     NSString *jiemi = [DES3Util decryptUseDES:jiami key:@"des"];
//     NSLog(@"\nDES加密:%@ \nDES解密:%@", jiami, jiemi);
    
    
#warning mark -- 
#warning mark AES加密解密
    // AES是美国联邦政府采用的一种区块加密标准。这个标准用来替代原先的DES，是一种对称加密算法
/********************🍎****************AES加密解密******************🍎********************/
//    // 必须保证加密解密所用的key是相同的
    
    ///////////////////////////////////对文件加密解密////////////////////////////////////////////
    //文件路径转换为string
    NSString *file = @"/Users/asl/Desktop/加密解密Demo/加密解密Demo/VideoVR.json";
    NSString *newFile = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
//     对文件进行加密
//    NSString *encryptedPWD = [AESCrypt encrypt:newFile password:@"key"]; // 加密
//    [encryptedPWD writeToFile:file atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
//     对文件进行解密
//    NSString *decryptedPWD = [AESCrypt decrypt:newFile password:@"key"]; // 解密
//    [decryptedPWD writeToFile:file atomically:YES encoding:NSUTF8StringEncoding error:nil];
//
    
    ///////////////////////////////////对字符串加密解密////////////////////////////////////////////
//    NSString *encryptedPWD = [AESCrypt encrypt:@"AES是对称加密算法，所以加密解密的所用的key值必须是相同的" password:@"key"]; // 加密
//    NSString *decryptedPWD = [AESCrypt decrypt:encryptedPWD password:@"key"]; // 解密
//    NSLog(@"\nAES加密后:%@  \nAES解密后:%@",encryptedPWD, decryptedPWD);
   
    
#warning mark --
#warning mark MD5加密
//******************🍎********************MD5加密*********************🍎********************
// 如果担心会被人破译，可以用加盐(在明文的固定位置插入随机串，然后再进行MD5)的方法对字符串进行加密
//    NSString *str = [self md5HexDigest:@"MD5是不可逆的只有加密没有解密，iOS代码加密使用方式如下"];
//    NSLog(@"\nMD5加密:%@", str);
//   
//    NSString *str1 = [self md5HexDigest:@"MD5是不可逆的只 有加密没有解密，iOS代码加密使用方式如下"];
//    NSLog(@"\nMD5加密:%@", str1);
    
#warning mark --
#warning mark base64加密解密
/*******************🍎********base64对NSData NSString加密解密**************🍎*******************/
//    [self base64StringFromData:[@"base64加密解密" dataUsingEncoding:NSUTF8StringEncoding]];
//    [self base64StringFromString:@"base64加密解密"];

/*******************🍎************base64对图片加密解密*****************🍎******************/
//    NSString *path = @"/Users/asl/Desktop/加密解密Demo/加密解密Demo/77.jpg";
//    [self base64StringFromImage:path]; // 加密
//    [self imageFromBase64String:path];  // 解密
    
}

#warning mark --
#warning mark base64加密
// 对图片加密
- (void)base64StringFromImage:(NSString *)imageFile {
    //文件路径转换为data
    NSData *date = [NSData dataWithContentsOfFile:imageFile];
    //对data进行base64编码
    NSData *imageData = [GTMBase64 encodeData:date];
    [imageData writeToFile:imageFile atomically:YES];
}

// 对图片解密
- (void)imageFromBase64String:(NSString *)imageFile {
    NSData *data = [NSData dataWithContentsOfFile:imageFile];
    NSData *imageData = [GTMBase64 decodeData:data];
    [imageData writeToFile:imageFile atomically:YES];
}
// base64对NSData加密解密
- (void)base64StringFromData:(NSData *)data {
    //  加密： [[NSString alloc] initWithData:[GTMBase64 encodeData:data]                   encoding:NSUTF8StringEncoding];
    //  解密： [[NSString alloc] initWithData:[GTMBase64 decodeString:base64Encoded]                    encoding:NSUTF8StringEncoding];
    
    // NSData自带有base64加密解密
    NSString *base64Encoded = [data base64EncodedStringWithOptions:0];
    NSLog(@"\nbase64加密:%@", base64Encoded);
    NSData *nsdataFromBase64String = [[NSData alloc] initWithBase64EncodedString:base64Encoded options:0];
    NSString *base64Decoded = [[NSString alloc] initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
    NSLog(@"\nbase64解密:%@", base64Decoded);
}
// base64对NSString加密解密
- (void)base64StringFromString:(NSString *)string {
    // 加密
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encodeString = [GTMBase64 stringByEncodingData:data];
    NSLog(@"\nbase64加密:%@  data:%@", encodeString, data);
    // 解密
    NSString *decodeString = [[NSString alloc] initWithData:[GTMBase64 decodeString:encodeString] encoding:NSUTF8StringEncoding];
    NSLog(@"\nbase64解密:%@", decodeString);
}

#warning mark --
#warning mark MD5加密
- (NSString *)md5HexDigest:(NSString *)input{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%2s",result];
    }
    return ret;
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
