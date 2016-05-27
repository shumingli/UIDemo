//
//  Helper.m
//  BoyAndGirl
//
//  Created by 李 树明 on 15-12-19.
//  Copyright (c) 2015年 李 树明. All rights reserved.
//

#import "UIHelper.h"

@implementation UIHelper

+ (UIProgressView *)createMakeVideoProgressViewWithFrame:(CGRect)rect{
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [progressView setFrame:rect];
    return progressView;
}

+ (UIProgressView *)createPlayVideoProgressViewWithFrame:(CGRect)rect{
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    [progressView setFrame:rect];
    progressView.progressTintColor = [UIColor colorWithRed:0/255.0 green:164/255.0 blue:94/255.0 alpha:0.98];
    progressView.trackTintColor = [UIColor colorWithRed:188/255.0 green:188/255.0 blue:188/255.0 alpha:0.98];  //进度条底颜色
    return progressView;
}
/**
 强制旋转屏幕为纵向 (注：这种方式 键盘不能旋转过来; iOS8.x下 UIAlterView旋转不过来  )
 @return
 */
+ (void)rotateOrientationPortrait{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = UIInterfaceOrientationPortrait;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}
/**
 强制旋转屏幕为横向，Home建向右 (注：这种方式 键盘不能旋转过来; iOS8.x下 UIAlterView旋转不过来  )
 @return
 */
+ (void)rotateOrientationLandscapeRight{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = UIInterfaceOrientationLandscapeRight;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}
/**
 添加图片模糊效果
 @parms  要添加模糊效果的view
 @return
 */
+ (UIVisualEffectView *)addVisualEffectViewWithView:(UIView *)view{
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.frame = CGRectMake(0, 0, view.frame.size.width,view.frame.size.height);
    [view addSubview:visualEffectView];
    return visualEffectView;
}
/**
 给图片设置阴影效果
 @parms  加阴影的view
 @return
 */
+ (void)shadowWithView:(UIView *)view{
    view.layer.shadowColor = [[UIColor grayColor] CGColor];//阴影的颜色
    view.layer.shadowOpacity = 0.5f;   // 阴影透明度
    view.layer.shadowOffset = CGSizeMake(-1.0,1.0f); // 阴影的范围
    view.layer.shadowRadius = 0.3;  // 阴影扩散的范围控制
}
/**
 计算单行文字的size
 @parms  文本
 @parms  字体
 @return  字体的CGSize
 */
+ (CGSize)sizeWithText:(NSString *)text withFont:(UIFont *)font{
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    return size;
}
/**
 计算多行文字的CGRect
 @parms  文本
 @parms  字体
 @return  字体的CGRect
 */
+ (CGRect)boundingRectWithString:(NSString *)str withSize:(CGSize)size withFont:(UIFont *)font{
    CGRect rect = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    return rect;
}



@end
