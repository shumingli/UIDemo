//
//  Helper.h
//  BoyAndGirl
//
//  Created by 李 树明 on 15-12-19.
//  Copyright (c) 2015年 李 树明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIHelper : NSObject{

}

/**
 强制旋转屏幕为纵向 (注：这种方式 键盘不能旋转过来; iOS8.x下 UIAlterView旋转不过来  )
 @return
 */
+ (void)rotateOrientationPortrait;
/**
 强制旋转屏幕为横向，Home建向右 (注：这种方式 键盘不能旋转过来; iOS8.x下 UIAlterView旋转不过来  )
 @return
 */
+ (void)rotateOrientationLandscapeRight;
/**
 添加图片模糊效果
 @parms  添加模糊的view
 @return
 */
+ (UIVisualEffectView *)addVisualEffectViewWithView:(UIView *)view;
/**
 给图片设置阴影效果
 @parms  加阴影的view
 @return
 */
+ (void)shadowWithView:(UIView *)view;
/**
 计算单行文字的size
 @parms  文本
 @parms  字体
 @return  字体的CGSize
 */
+ (CGSize)sizeWithText:(NSString *)text withFont:(UIFont *)font;
/**
 计算多行文字的CGRect
 @parms  文本
 @parms  字体
 @return  字体的CGRect
 */
+ (CGRect)boundingRectWithString:(NSString *)str withSize:(CGSize)size withFont:(UIFont *)font;

@end




