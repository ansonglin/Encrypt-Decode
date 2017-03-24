//
//  DES3Util.h
//  加密解密Demo
//
//  Created by asl on 16/11/3.
//  Copyright © 2016年 Invisionhealth Digital Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DES3Util : NSObject

//加密方法
+(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;
//解密方法
+(NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;

@end
