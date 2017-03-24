//
//  NSData+AES256.h
//  加密解密Demo
//
//  Created by asl on 16/10/25.
//  Copyright © 2016年 Invisionhealth Digital Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSData (AES256)

-(NSData *)aes256_encrypt:(NSString *)key;
-(NSData *)aes256_decrypt:(NSString *)key;

@end
