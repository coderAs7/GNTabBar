//
//  CCDMainTabBar.h
//  CheCaiDuo
//
//  Created by ccd on 16/11/1.
//  Copyright © 2016年 ccd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CCDMainTabBar : UITabBar

/*
 如果tabBarViewController的ViewControllers的个数是偶数,那么会自动调整位置,
 如果是奇数,那么这个按钮会自动覆盖掉中间的
 */
@property (nonatomic,strong) UIButton *centerButton;

// 下面两者仅仅允许设置其中一个,如果同时设置,将以 centerButton_centerY 为准
// 如果均不设置,那么默认设置水平居中,垂直居中...

/*
 允许外界设置设置centerButton的center中的Y值,X值不允许设置
 */
@property (nonatomic,assign) CGFloat centerButton_centerY;
/*
 允许外界设置设置centerButton的center中的Y值的比例系数,这个系数会自动乘以tabBar的高度,X值不允许设置 范围 0 - 1
 */
@property (nonatomic,assign) CGFloat centerButton_centerY_ratio;
@end
