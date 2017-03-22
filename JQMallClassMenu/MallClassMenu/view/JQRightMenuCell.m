//
//  JQRightMenuCell.m
//  JQMallClassMenu
//
//  Created by tlkj on 17/3/21.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#import "JQRightMenuCell.h"
#import "JQMenuModel.h"

@implementation JQRightMenuCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatCell];
    }
    return self;
}

- (void)creatCell{
    _menuTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, self.contentView.frame.size.height - 20, self.contentView.frame.size.width, 20)];
    _menuTitle.textAlignment = NSTextAlignmentCenter;
    _menuTitle.textColor = RGBACOLOR(51, 51, 51, 1);//#333333
    _menuTitle.font = [UIFont systemFontOfSize:12.0f];
    [self.contentView addSubview:self.menuTitle];
    
    _menuImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, self.contentView.frame.size.width - 20, self.contentView.frame.size.height - 20 - 20)];
    _menuImage.backgroundColor =RGBACOLOR(255, 255, 255, 1);
    [self.contentView addSubview:self.menuImage];
}

-(void)setMenuModel:(JQMenuModel *)menuModel{
    _menuModel = menuModel;
    _menuTitle.text = [NSString stringWithFormat:@"%@",menuModel.menu];
    _menuImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",menuModel.image]];
}

@end
