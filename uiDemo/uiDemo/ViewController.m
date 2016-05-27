//
//  ViewController.m
//  uiDemo
//
//  Created by mac on 16/5/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "UIHelper.h"
#import "DataHelper.h"
#import "UIImage+QRCode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeQRCode];
}
/**
 生成二维码
 */
- (void)makeQRCode{
    UIButton *QRCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    QRCodeBtn.backgroundColor = [UIColor orangeColor];
    QRCodeBtn.layer.cornerRadius = 5;
    QRCodeBtn.frame = CGRectMake(20,self.view.frame.size.height - 60 , self.view.frame.size.width-40, 30);
    [QRCodeBtn setTitle:@"生成二维码" forState:UIControlStateNormal];
    [QRCodeBtn addTarget:self action:@selector(makeQRCodeEvent:) forControlEvents:UIControlEventTouchUpInside];
    QRCodeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    QRCodeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [QRCodeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:QRCodeBtn];
}
- (void)makeQRCodeEvent:(UIButton *)sender{
    CGFloat width = 200;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imgView.frame = CGRectMake(20, 70, width, width);
    imgView.layer.shadowColor = [UIColor blackColor].CGColor;
    imgView.layer.shadowOffset = CGSizeMake(1, 2);
    imgView.layer.shadowRadius = 1;
    imgView.layer.shadowOpacity = 0.5;
    [self.view addSubview:imgView];
    imgView.alpha = 0.8;
    
    imgView.image = [UIImage qrImageWithContent:@"http://7xj11m.com1.z0.glb.clouddn.com/2016.05.2727C567D7-3F88-4DD4-8F76-BB2F984A1390.jpeg?imageView2/1/w/160/h/219" logo:[UIImage imageNamed:@"smallIcon"] size:width red:0 green:0 blue:0];
}


/**
 敏感词过滤
 */
- (void)testFilterString{
    NSString *testStr = @"大家都是好人，只有他是坏人。测试";
    NSArray *filterArray = [NSArray arrayWithObjects:@"坏人",@"测试", nil];
    testStr = [DataHelper stringFilterDirtyWord:testStr withDirtyLibrary:filterArray];
    
    NSLog(@"testStr = %@",testStr);
}

/**
 图片加阴影效果
 */
- (void)setShadow{
    UIImage *img = [UIImage imageNamed:@"Homepage－wman"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50,img.size.width,img.size.height)];
    imgView.image = img;
    [self.view addSubview:imgView];
    [UIHelper shadowWithView:imgView];
    
    UIImage *img2 = [UIImage imageNamed:@"Homepage－wman"];
    UIImageView *imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100,img.size.width,img.size.height)];
    imgView2.image = img2;
    [self.view addSubview:imgView2];
}
/**
 根据文本设置label的size
 */
- (void)setLabelFrame{
    NSString *text = @"的经济围殴减肥减肥就是了类似；11爱几分几房间诶诶诶计费计费看看书看书看书看手机费附加的经济围殴减肥减肥就是了类似；22爱几分几房间诶诶诶计费计费看看书看书看书看手机费附加爱几分几房间诶诶诶计费计费看看书看书看书看手机费附加的经济围殴减肥减肥就是了类似；33爱几分几房间诶诶诶计44费计费看看书看书看书55看手机费附加66";
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    //    NSLog(@"sizesize -- %lf  %lf",size.width,size.height);
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 300, 20)];
    lab.text = text;
    lab.numberOfLines = 0;
    lab.backgroundColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:lab];
    CGRect rect = [UIHelper boundingRectWithString:text withSize:CGSizeMake(300, 1000) withFont:lab.font];
    NSLog(@"rectrect---- %@",NSStringFromCGRect(rect));
    lab.frame = CGRectMake(0, 100, 300, rect.size.height+size.height);
}
/**
 半透明效果
 */
- (void)addVisualEffectView{
    UIImage *img = [UIImage imageNamed:@"3.png"];
    UIImageView *videoBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50,img.size.width,img.size.height)];
    videoBgView.image = img;
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.frame = CGRectMake(0, 0, videoBgView.frame.size.width,videoBgView.frame.size.height);
    [videoBgView addSubview:visualEffectView];
    [self.view addSubview:videoBgView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









@end
