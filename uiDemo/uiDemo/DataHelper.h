//
//  DataHelper.h
//  BoyAndGirl
//
//  Created by 李 树明 on 15-12-19.
//  Copyright (c) 2015年 李 树明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHelper : NSObject{
    
}
@property (nonatomic,strong) NSMutableDictionary *mapScaleData; //地图放大或缩小是存的数据
@property (nonatomic,assign) NSInteger oriStartTime;  //开始不可旋转屏幕 视频上传时间
@property (nonatomic,assign) NSInteger oriEndTime;
@property (nonatomic,assign) NSInteger fromLookBackPageType;

- (void)clearMapScaleData;

+ (BOOL)isMySelfWithUserId:(NSString *)userId;

+ (DataHelper *)getInstance;
/**
 *   获取系统版本号
 */
+ (NSString *)getSystemVersion;
/**
 获取App版本号
 @return app版本号
 */
+ (NSString *)getAppVersion;
/**
 获取资源版本号
 @return 资源版本号
 */
+ (NSString *)getResourceVersion;
/**
 设置资源版本号
 @parms 资源版本号
 */
+ (void)setResourceVersion:(NSString *)version;
/**
 获取多语言文本内容
 @parms 文本key
 @return 文本内容
 */
+ (NSString *)getLocalizedStringForKey:(NSString *)key;
/**
 格式化时间 格式化为：YYY.MM.dd HH:mm
 @parms 时间戳
 @return 格式化后的时间字符串
 */
+ (NSString*)strDateSpecific:(NSString*)timeStamp;
/**
 格式化时间 格式化为年月日时分秒 格式化为：YYY-MM-dd HH:mm:ss
 @parms 时间戳
 @return 格式化后的时间字符串
 */
+ (NSString*)convertTimeYMDHMS:(NSString*)timeStamp;
/**
 格式化时间 格式化为 1小时20分50秒的格式
 @parms 秒
 @return 格式化后的时间字符串
 */
+ (NSString *)convertTimeHHMMSS:(NSInteger)second;
/**
 格式化时间 格式化为 00:00:00 格式
 @parms 秒
 @return 格式化后的时间字符串
 */
+ (NSString *)convertTime:(NSInteger)second;
/**
 格式化时间 格式化为 00:00 格式
 @parms 秒
 @return 格式化后的时间字符串
 */
+ (NSString *)formatTimeMMSS:(NSInteger)second;
/**
 CMTime转换为秒
 @parms CMTime结构体
 @return 秒
 */
/*
+ (CGFloat)getSecondWithTime:(CMTime)time;
 */
/**
 获取系统时间
 @return 时间戳
 */
+ (NSTimeInterval)getSystemTime;
/**
 获取沙盒主目录路径
 @return 目录路径  /Home/Document/
 */
+ (NSString *)getHomeDirectory;
/**
 获取Documents目录路径
 @return 目录路径  /Home/Document/
 */
+ (NSString *)getDocumentDirectory;
/**
 获取Documents目录下，制度文件名的文件全路径
 @parms 文件完整路径
 @return 文件全路径  /Home/Document/text.txt
 */
+ (NSString *)getFilePathByDocumentDirectoryWithFileName:(NSString *)fileName;
/**
 获取Caches目录路径
 @return 目录路径  /Home/Chches/
 */
+ (NSString *)getCacheDirectory;
/**
 获取tmp目录路径
 @return 目录路径  /Home/temp/
 */
+ (NSString *)getTempDirectory;
/**
 判断指定路径的文件是否存在
 @parms 文件完整路径
 @return  是否存在  YES or NO
 */
+ (BOOL)fileExistsAtPath:(NSString *)filePath;
/**
 判断是否可以删除文件
 @parms 文件完整路径
 @return  是否存在  YES or NO
 */
+ (BOOL)isDeletableFileAtPath:(NSString *)filePath;
/**
 删除指定路径的文件
 @parms 文件完整路径
 @return  是否删除成功  YES or NO
 */
+ (BOOL)removeFileAtPath:(NSString *)filePath;
/**
 制度路径 创建文件
 @parms 文件完整路径
 @return  文件是否创建成功  YES or NO
 */
+ (BOOL)createDirectoryAtPath:(NSString *)path;
/**
 查找文件完整路径
 @parms 文件名  如：test.txt
 @return 完整路径
 */
+ (NSString *)getFilePathForFileName:(NSString *)fileName;
/**
 获取指定目录的子目录路径
 @parms 路径
 @return 所有子目录
 */
+ (NSArray *)getSubpathsOfDirectoryAtPath:(NSString *)path;
/**
 获取app udid
 @return udid
 */
+ (NSString *)generateUuidString;
/**
 md5处理
 @parms 字符串
 @return md5后的字符串
 */
+ (NSString *)md5WithStr:(NSString *)str;

/**
 敏感词过滤  
 @example:
 NSString *testStr = @"大家都是好人，只有他是坏人。测试";
 NSArray *filterArray = [NSArray arrayWithObjects:@"坏人",@"测试", nil];
 testStr = [DataHelper stringFilterDirtyWord:testStr withDirtyLibrary:filterArray];
 
 @parms 要处理的字符串
 @parms 要过滤的词
 @return 处理后的字符串
 */
+ (NSString *)stringFilterDirtyWord:(NSString *)checkStr withDirtyLibrary:(NSArray *)array;

@end





