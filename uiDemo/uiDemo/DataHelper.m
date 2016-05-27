//
//  DataHelper.m
//  BoyAndGirl
//
//  Created by 李 树明 on 15-12-19.
//  Copyright (c) 2015年 李 树明. All rights reserved.
//

#import "DataHelper.h"
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
#import <CoreLocation/CoreLocation.h>

static NSString *homeDir = NULL;
static NSString *docDir = NULL;
static NSString *cachesDir = NULL;
static NSString *tmpDir = NULL;

@implementation DataHelper

static DataHelper *dataHelper = NULL;
static dispatch_once_t dispatch;

+ (DataHelper *)getInstance{
    dispatch_once(&dispatch, ^{
        if (dataHelper == nil) {
            dataHelper = [[DataHelper alloc] init];
        }
    });
    return dataHelper;
}
+ (NSString *)getSystemVersion{
    return [UIDevice currentDevice].systemVersion;
}
+ (NSString *)getAppVersion{
    NSDictionary *infoDict =[[NSBundle mainBundle] infoDictionary];
    NSString *versionNum =[infoDict objectForKey:@"CFBundleVersion"];
    return versionNum;
}
+ (NSString *)getResourceVersion{
    NSString *resourceVersion = [[NSUserDefaults standardUserDefaults] stringForKey:@"resourceVersion"];
    if (!resourceVersion) {
        return @"";
    }
    return resourceVersion;
}
+ (void)setResourceVersion:(NSString *)version{
    [[NSUserDefaults standardUserDefaults] setObject:version forKey:@"resourceVersion"];
}
+ (NSString *)getLocalizedStringForKey:(NSString *)key{
    NSString *content = NSLocalizedString(key,@"");
    return content;
}
+ (NSString*)strDateSpecific:(NSString*)timeStamp{
    NSInteger dateInter=[timeStamp integerValue];
    //格式化日期时间
    NSDate *temp=[NSDate dateWithTimeIntervalSince1970:dateInter];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYY.MM.dd HH:mm"];
    NSString * dateStr=[dateformatter stringFromDate:temp];
    return dateStr;
}
+ (NSString *)convertTime:(NSInteger)second{
    if (second < 0) {
        second = 0;
    }
    NSInteger seconds = second % 60;
    NSInteger minutes = (second / 60) % 60;
    NSInteger hours = second / 3600;
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)hours, (long)minutes, (long)seconds];
}
+ (NSString *)formatTimeMMSS:(NSInteger)second{
    if (second < 0) {
        second = 0;
    }
    NSInteger seconds = second % 60;
    NSInteger minutes = second / 60;
    return [NSString stringWithFormat:@"%02ld:%02ld",(long)minutes, (long)seconds];
}

+ (NSString *)convertTimeHHMMSS:(NSInteger)second{
    if (second < 0) {
        second = 0;
    }
    NSInteger seconds = second % 60;
    NSInteger minutes = (second / 60) % 60;
    NSInteger hours = second / 3600;
    NSString *resStr = [NSString stringWithFormat:@""];
    if (hours > 0) {
        resStr = [NSString stringWithFormat:@"%@%ld小时",resStr,(long)hours];
    }
    if (minutes > 0) {
        resStr = [NSString stringWithFormat:@"%@%ld分",resStr,(long)minutes];
    }
    if (seconds > 0) {
        resStr = [NSString stringWithFormat:@"%@%ld秒",resStr,(long)seconds];
    }
    return resStr;
}

+ (NSString*)convertTimeYMDHMS:(NSString*)timeStamp{
    if (!timeStamp || [timeStamp isEqualToString:@""]) {
        return @"";
    }
    NSInteger dateInter=[timeStamp integerValue];
    //格式化日期时间
    NSDate *temp=[NSDate dateWithTimeIntervalSince1970:dateInter];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYY-MM-dd HH:mm:ss"];
    NSString * dateStr=[dateformatter stringFromDate:temp];
    return dateStr;
}
/*
+ (CGFloat)getSecondWithTime:(CMTime)time{
    CGFloat second = time.value/time.timescale;// 转换成秒
    return second;
}
*/
+ (NSTimeInterval)getSystemTime{
    NSDate *date=[NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval timeInt = [date timeIntervalSince1970];
    return timeInt;
}
+ (NSString *)getHomeDirectory{
    if (homeDir == NULL) {
        homeDir = NSHomeDirectory();
    }
    return homeDir;
}
+ (NSString *)getDocumentDirectory{
    if (docDir == NULL) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        docDir = [paths objectAtIndex:0];
    }
    return docDir;
}
+ (NSString *)getFilePathByDocumentDirectoryWithFileName:(NSString *)fileName{
    NSString *docPath = [DataHelper getDocumentDirectory];
    NSString *docDataPath = [docPath stringByAppendingPathComponent:fileName];
    return docDataPath;
}
// 获取Caches目录路径
+ (NSString *)getCacheDirectory{
    if (cachesDir == NULL) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        cachesDir = [paths objectAtIndex:0];
    }
    return cachesDir;
}
// 获取tmp目录路径
+ (NSString *)getTempDirectory{
    if (tmpDir == NULL) {
        tmpDir = NSTemporaryDirectory();
    }
    return tmpDir;
}
// lastPathComponent --扩展名
+ (NSString *)getFilePathForFileName:(NSString *)fileName{
    NSString *ext = [fileName pathExtension];
    NSString *nameDelExt = [fileName stringByDeletingPathExtension];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:nameDelExt ofType:ext];
    return filePath;
}

+ (BOOL)isDeletableFileAtPath:(NSString *)filePath{
    BOOL isDele = [[NSFileManager defaultManager] isDeletableFileAtPath:filePath];
    return isDele;
}
+ (BOOL)removeFileAtPath:(NSString *)filePath{
    if ([DataHelper isDeletableFileAtPath:filePath]) {
        BOOL isDele = [[NSFileManager defaultManager] removeItemAtPath:filePath error:NULL];
        return isDele;
    }
    return NO;
}
+ (BOOL)fileExistsAtPath:(NSString *)filePath{
    BOOL isExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    return isExists;
}
+ (BOOL)createDirectoryAtPath:(NSString *)path{
    if (![self fileExistsAtPath:path]) {
        return [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:NULL error:NULL];
    }
    return YES;
}

+ (NSArray *)getSubpathsOfDirectoryAtPath:(NSString *)path{
    NSArray *pathList = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:path error:nil];
    return pathList;
}

+ (NSString *)generateUuidString{
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *uuidString = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
    CFRelease(uuid);
    return uuidString;
}

+ (NSString *)md5WithStr:(NSString *)str{
    const char * pointer = [str UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(pointer, (CC_LONG)strlen(pointer), md5Buffer);
    NSMutableString *string = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [string appendFormat:@"%02x",md5Buffer[i]];
    }
    return string;
}
+ (NSString *)stringFilterDirtyWord:(NSString *)checkStr withDirtyLibrary:(NSArray *)array{
    NSString *retStr = [NSString stringWithString:checkStr];
    for (NSString *str in array) {
        if ([retStr rangeOfString:str].location != NSNotFound) {
//            NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:str];
//            retStr = [[retStr componentsSeparatedByCharactersInSet:doNotWant] componentsJoinedByString:@"*"];
            retStr = [retStr stringByReplacingOccurrencesOfString:str withString:@"**"];
        }
        
    }
    return retStr;
}


@end




