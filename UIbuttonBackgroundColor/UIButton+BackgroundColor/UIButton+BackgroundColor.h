//
//  UIButton+BackgroundColor.h
//  UIbuttonBackgroundColor
//
//  Created by Alex on 16/3/11.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BackgroundColor)

/**
 The color for a normal state.
 */
@property (nonatomic, strong) UIColor *normalBackgroundColor;

/**
 The color for a highlighted state.
 */
@property (nonatomic, strong) UIColor *highlightedBackgroundColor;

- (void)setBackgroundColor:(UIColor *)backgroundColor State:(UIControlState)state;

@end
