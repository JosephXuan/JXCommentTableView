//
//  JXBaseViewController.m
//  JXAVPlayerView
//
//  Created by JosephXuan on 2019/10/21.
//  Copyright © 2019 JosephXuan. All rights reserved.
//

#import "JXBaseViewController.h"

@interface JXBaseViewController ()

@end

@implementation JXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark - 控制屏幕旋转方法
//是否自动旋转,返回YES可以自动旋转,返回NO禁止旋转
//Interface的方向是否会跟随设备方向自动旋转，如果返回NO,后两个方法不会再调用
- (BOOL)shouldAutorotate{
   
    return NO;
}
//返回支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
   
    return UIInterfaceOrientationMaskPortrait;
}
//由模态推出的视图控制器 优先支持的屏幕方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    
    return UIInterfaceOrientationPortrait;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
