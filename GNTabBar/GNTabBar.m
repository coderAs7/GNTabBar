//
//  CCDMainTabBar.m
//  CheCaiDuo
//
//  Created by ccd on 16/11/1.
//  Copyright © 2016年 ccd. All rights reserved.
//

#import "CCDMainTabBar.h"

@implementation CCDMainTabBar
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _centerButton_centerY = -10000;
        _centerButton_centerY_ratio = -10000;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.centerButton) {
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        
        BOOL shouAdjustSubViewsPosition = !(self.items.count % 2);
        
        CGFloat buttonH = height;
        CGFloat buttonW = shouAdjustSubViewsPosition ? (width / (self.items.count + 1)) : (width / self.items.count);

        if (_centerButton_centerY_ratio != -10000) {
            self.centerButton.center = CGPointMake(width * 0.5, height * _centerButton_centerY_ratio);
        }
        if(_centerButton_centerY != -10000){
            self.centerButton.center = CGPointMake(width * 0.5, _centerButton_centerY);
        }
        if (_centerButton_centerY == -10000 && _centerButton_centerY_ratio == -10000) {
            self.centerButton.center = CGPointMake(width * 0.5, height * 0.5);
        }
        
        
        if (shouAdjustSubViewsPosition) {
            NSInteger index = 0;
            CGFloat buttonY = 0;
            NSInteger cutOffIndex = self.items.count / 2 - 1;
            for (UIControl *button in self.subviews) {
                if (![button isKindOfClass:[UIControl class]] || button == self.centerButton) continue;
                
                CGFloat buttonX = buttonW * ((index > cutOffIndex)?(index + 1):index);
                button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
                
                index++;
            }
        }
        [self addSubview:self.centerButton];
    }
}

#pragma mark - private Methods
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.centerButton) {
        CGPoint chatP;
        chatP = [self convertPoint:point toView:self.centerButton];
        if ([self.centerButton pointInside:chatP withEvent:event]) {
            return self.centerButton;
        }
    }
    return [super hitTest:point withEvent:event];
}


#pragma mark - getter&setter
- (void)setCenterButton:(UIButton *)centerButton{
    _centerButton = centerButton;
    [self setNeedsLayout];
}

@end
