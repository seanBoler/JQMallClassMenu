//
//  JQLeftMenuCell.m
//  JQMallClassMenu
//
//  Created by tlkj on 17/3/21.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#import "JQLeftMenuCell.h"
#import "JQMenuModel.h"


@implementation JQLeftMenuCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatCell];
    }
    return self;
}

-(void)creatCell{
    _lineLogo = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 4, self.contentView.frame.size.height)];
    _lineLogo.backgroundColor = RGBACOLOR(208, 0, 7, 1);
    [self.contentView addSubview:self.lineLogo];
    
    _menuClass = [[UILabel alloc]initWithFrame:CGRectMake(6, 0, self.contentView.frame.size.width-6, self.contentView.frame.size.height)];
    _menuClass.textColor = RGBACOLOR(51, 51, 51, 1);//#333333
    _menuClass.font = [UIFont systemFontOfSize:14.0f];
    //_menuClass.textAlignment = NSTextAlignmentCenter;//居中
    [self.contentView addSubview:self.menuClass];
    
}

-(void)setClassModel:(JQMenuClassModel *)classModel{
    _classModel = classModel;
    self.menuClass.text = [NSString stringWithFormat:@"%@",classModel.classTitle];
}

-(void)configCellWithTitle:(NSString *)str andIndexPath:(NSIndexPath *)indexPath andSelectIndexPath:(NSIndexPath *)selectIndexPath{
    
    if (indexPath.section == selectIndexPath.section && indexPath.row == selectIndexPath.row){
        self.backgroundColor = [UIColor whiteColor];

        self.lineLogo.hidden = NO;
        self.menuClass.textColor = RGBACOLOR(208, 0, 7, 1);
    }else {
        self.lineLogo.hidden = YES;
        self.menuClass.textColor = RGBACOLOR(51, 51, 51, 1);
        self.backgroundColor = RGBACOLOR(241, 242, 243, 1);


    }
}

@end
