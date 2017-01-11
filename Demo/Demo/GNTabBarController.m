


//
//  GNTabBarController.m
//  Demo
//
//  Created by ccd on 17/1/11.
//  Copyright © 2017年 ccd. All rights reserved.
//

#import "GNTabBarController.h"
#import "GNTabBar.h"

@interface GNTabBarController ()
@property (nonatomic,strong) UIButton *tabBarCenterButton;
@end

@implementation GNTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChildViewController];

    // 自定义的TabBar,目的是实现中间的按钮的高度自定义
    GNTabBar *tabBar = [[GNTabBar alloc]init];
    
    // 设置tabBar中间按钮的尺寸
    [self.tabBarCenterButton sizeToFit];
    
    tabBar.centerButton = self.tabBarCenterButton;
    tabBar.centerButton_centerY_ratio = 0.2;
    tabBar.backgroundColor = [UIColor whiteColor];
    tabBar.translucent = NO;
    
    [self setValue:tabBar forKey:@"tabBar"];
    
    
}
- (void)addChildVC:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
#pragma mark - getter & setter
- (UIButton *)tabBarCenterButton{
    // tabBar中间的按钮
    if (!_tabBarCenterButton) {
        _tabBarCenterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tabBarCenterButton setImage:[UIImage imageNamed:@"tabBar_center_icon"] forState:UIControlStateNormal];
        [_tabBarCenterButton setImage:[UIImage imageNamed:@"tabBar_center_icon"] forState:UIControlStateHighlighted];
        [_tabBarCenterButton addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tabBarCenterButton;
}

#pragma mark - privateMethods
- (void)showAlert{
    UIAlertController *alertVC = [[UIAlertController alloc]init];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"PHP是世界上最好的语言" style:0 handler:nil];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"同意" style:0 handler:nil];
    
    
    [alertVC addAction:action1];
    [alertVC addAction:action2];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)setUpChildViewController{
    // 创建四个控制器
    UIViewController *vc1 = [[UIViewController alloc]init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    UIViewController *vc2 = [[UIViewController alloc]init];
    vc2.view.backgroundColor = [UIColor whiteColor];
    UIViewController *vc3 = [[UIViewController alloc]init];
    vc3.view.backgroundColor = [UIColor whiteColor];
    UIViewController *vc4 = [[UIViewController alloc]init];
    vc4.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildVC:vc1 title:@"我要投资" image:[UIImage imageNamed:@"beginToFinance"] selectedImage:[UIImage imageNamed:@"beginToFinance_selected"]];
    [self addChildVC:vc2 title:@"理财资讯" image:[UIImage imageNamed:@"assetNews"] selectedImage:[UIImage imageNamed:@"assetNews_selected"]];
    [self addChildVC:vc3 title:@"帮助中心" image:[UIImage imageNamed:@"tabBar_helpCenter"] selectedImage:[UIImage imageNamed:@"tabBar_helpCenter_selected"]];
    [self addChildVC:vc4 title:@"每日签到" image:[UIImage imageNamed:@"tabBar_signIn"] selectedImage:[UIImage imageNamed:@"tabBar_signIn_selected"]];
    
}
@end
