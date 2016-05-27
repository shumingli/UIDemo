

#import <UIKit/UIKit.h>

@interface UIImage (QRCode)
+ (UIImage *)qrImageByContent:(NSString *)content;
+ (UIImage *)qrImageWithContent:(NSString *)content size:(CGFloat)size;
+ (UIImage *)qrImageWithContent:(NSString *)content size:(CGFloat)size red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
/*
 生成二维码
 @prams 要生成二维码的链接地址
 @prams 二维码中间的小logo
 @prams 要生成二维码size
 @prams 要生成二维码色值 r
 @prams 要生成二维码色值 g
 @prams 要生成二维码色值 b
 */
+ (UIImage *)qrImageWithContent:(NSString *)content logo:(UIImage *)logo size:(CGFloat)size red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;


@end
