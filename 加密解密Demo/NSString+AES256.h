//
//  NSString+AES256.h
//  加密解密Demo
//
//  Created by asl on 16/10/25.
//  Copyright © 2016年 Invisionhealth Digital Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "NSData+AES256.h"

@interface NSString (AES256)

-(NSString *)aes256_encrypt:(NSString *)key;
-(NSString *)aes256_decrypt:(NSString *)key;

@end
