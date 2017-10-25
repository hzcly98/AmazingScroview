//
//  AmazingScrollView.m
//  AmazingSrollView
//
//  Created by hzc on 2017/10/24.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "AmazingScrollView.h"

static int const unit = 5;
static CGFloat const longHeight = 15;
static CGFloat const shortHeight = 7;

@implementation AmazingScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 这里想做成投资范围是0~20W，所以contentsize设为2000，那么没一个像素点对应100元，5个像素点画一条线作为一小格，也就是500元一小格
        self.contentInset = UIEdgeInsetsMake(0, self.bounds.size.width / 2, 0, self.bounds.size.width / 2);
        self.contentSize = CGSizeMake(2000, 0);
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        [self setUp];
    }
    return self;
}

- (void)setUp {
    
    UIView *redV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentSize.width, self.bounds.size.height)];
//    redV.backgroundColor = [UIColor redColor];
    [self addSubview:redV];
    
    for (int i = 0; i <= self.contentSize.width; i ++) {
        if (i % unit == 0) {
            CGFloat height = i % (unit * 5) == 0 ? longHeight : shortHeight;
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(i, 0, 1, height)];
            line.backgroundColor = [UIColor lightGrayColor];
            [redV addSubview:line];
            CGRect frame = line.frame;
            frame.origin.y = self.bounds.size.height - frame.size.height;
            line.frame = frame;
        }
    }
    
    
}


@end
