//
//  ViewController.m
//  UIbuttonBackgroundColor
//
//  Created by Alex on 16/3/11.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+BackgroundColor.h"
//#import "UIButton+ANDYHighlighted.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _button.backgroundColor = [UIColor yellowColor];
    _button.highlightedBackgroundColor = [UIColor blueColor];
}

- (void)btnTouchUpInside:(UIButton *)sender
{
    [_button setBackgroundColor:[UIColor blueColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
