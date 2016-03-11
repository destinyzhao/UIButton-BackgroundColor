//
//  UIButton+BackgroundColor.m
//  UIbuttonBackgroundColor
//
//  Created by Alex on 16/3/11.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "UIButton+BackgroundColor.h"
#import <objc/runtime.h>

/**
 Key for a normal backgroundColor.
 */
const char *BackgroundColorNormal ;

/**
 Key for a highlighted backgroundColor.
 */
const char *BackgroundColorHighlighted;

@implementation UIButton (BackgroundColor)

- (void)setBackgroundColor:(UIColor *)backgroundColor State:(UIControlState)state
{
    
    [self setBackgroundImage:[self imageWithColor:backgroundColor] forState:state];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


#pragma mark - Setters

- (void)setNormalBackgroundColor:(UIColor *)normal
{
    objc_setAssociatedObject(self,
                             @selector(normalBackgroundColor),
                             normal,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)setHighlightedBackgroundColor:(UIColor *)highlighted
{
    self.normalBackgroundColor = self.backgroundColor;
    objc_setAssociatedObject(self,
                             @selector(highlightedBackgroundColor),
                             highlighted,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Getters

- (UIColor *)normalBackgroundColor
{
    return objc_getAssociatedObject(self,
                                    @selector(normalBackgroundColor));
}

- (UIColor *)highlightedBackgroundColor
{
    return objc_getAssociatedObject(self,
                                    @selector(highlightedBackgroundColor));
}

#pragma mark - ControlState

- (void)setHighlighted:(BOOL)highlighted
{
    super.highlighted = highlighted;
    
    if (self.highlightedBackgroundColor)
    {
        self.backgroundColor = self.highlighted ? self.highlightedBackgroundColor : self.normalBackgroundColor;
    }
}


@end
