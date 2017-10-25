//
//  ViewController.m
//  AmazingSrollView
//
//  Created by hzc on 2017/10/24.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "ViewController.h"
#import "AmazingScrollView.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = 340;
    AmazingScrollView *scr = [[AmazingScrollView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - width) / 2, 200, width, 50)];
    scr.delegate = self;
//    scr.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:scr];
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(scr.frame.origin.x, scr.frame.origin.y + scr.bounds.size.height - 1, scr.bounds.size.width, 1)];
    bottomLine.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bottomLine];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 32)];
    _label.textColor = [UIColor redColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:32];
    _label.text = @"100";
//    _label.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_label];
    CGRect frame = _label.frame;
    frame.origin.x = (self.view.bounds.size.width - frame.size.width) / 2;
    frame.origin.y = scr.frame.origin.y - 15 - frame.size.height;
    _label.frame = frame;
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, scr.bounds.size.height + 15)];
    line.backgroundColor = [UIColor redColor];
    [self.view addSubview:line];
    CGRect frameLine = line.frame;
    frameLine.origin.x = (self.view.bounds.size.width - frameLine.size.width) / 2;
    frameLine.origin.y = scr.frame.origin.y - 15;
    line.frame = frameLine;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"%f",scrollView.contentOffset.x);
    // y = k * x + b  线性函数
    int value = (int)(scrollView.contentOffset.x * 100 + scrollView.bounds.size.width / 2 * 100);
    value = value == 0 ? 100 : value; // 最小为0，但是这里把它设为100，一般是100起投。
    _label.text = [NSString stringWithFormat:@"%zd",value];
    
}


@end
