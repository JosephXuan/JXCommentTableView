//
//  JXBaseTabBarController.m
//  JXAVPlayerView
//
//  Created by JosephXuan on 2019/10/21.
//  Copyright © 2019 JosephXuan. All rights reserved.
//

#import "JXBaseTabBarController.h"
#import "JXCommentTools.h"
#import "JXCommentCtrl.h"
#import "JXMineCtrl.h"

#import "JXBaseNavigationController.h"
@interface JXBaseTabBarController ()

@end

@implementation JXBaseTabBarController
+ (void)load {
    
    if (@available(iOS 10.0, *)) {
        [[UITabBar appearance] setUnselectedItemTintColor:KAppColorRGB(108, 108, 108)];
        [[UITabBar appearance]setTintColor:KAppColorRGB(42, 162, 218)];
       } else{
//           [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#acacac"], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
//
//           [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor WTMainContentColor],NSForegroundColorAttributeName, nil]forState:UIControlStateSelected];
       }
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName: KAppColorRGB(108, 108, 108)} forState:UIControlStateNormal];
    
    [item setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11],NSForegroundColorAttributeName: KAppColorRGB(42, 162, 218)} forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
   
    //下方属性 tabbar 会为透明
    //self.tabBar.shadowImage = [UIImage new];
    //self.tabBar.backgroundImage = [UIImage new];
    
    [self setupAllViewController];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
   
}

#pragma mark - private method
- (void)setupAllViewController {
    
     [self setupOneViewController:[[JXCommentCtrl alloc] init] image:[UIImage imageNamed:@"TabBar_home"] selImage:[UIImage imageNamed:@"TabBar_home_sel"] title:@"首页"];
    
    [self setupOneViewController:[[JXMineCtrl alloc] init] image:[UIImage imageNamed:@"TabBar_mine"] selImage:[UIImage imageNamed:@"TabBar_mine_sel"] title:@"个人"];
   
   
}

/// 设置单个子控制器
- (void)setupOneViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title {
    JXBaseNavigationController *nav = [[JXBaseNavigationController alloc] initWithRootViewController:vc];
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    vc.title = title;
    [self addChildViewController:nav];
}

//支持旋转
- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
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
