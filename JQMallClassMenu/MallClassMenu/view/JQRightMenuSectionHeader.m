//
//  JQRightMenuSectionHeader.m
//  JQMallClassMenu
//
//  Created by tlkj on 17/3/21.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//
#define backGreenColor [UIColor colorWithRed:219/255.0 green:59/255.0 blue:55/255.0 alpha:1]
#import "JQRightMenuSectionHeader.h"
#import "JQMenuModel.h"
@implementation JQRightMenuSectionHeader

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _line=[[UIView alloc]initWithFrame:CGRectMake(0, 8, 4, 14)];
        _line.backgroundColor=backGreenColor;
        [self addSubview:self.line];
        _sectionTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 30)];
        _sectionTitle.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:self.sectionTitle];
    }
    return self;
}

//- (void) setLabelText:(NSString *)text
//{
//    self.sectionTitle.text = text;
//    
//}


-(void)setSectionModel:(JQSectionTitleModel *)sectionModel{
    _sectionModel = sectionModel;
    _sectionTitle.text = [NSString stringWithFormat:@"%@",sectionModel.sectionTitle];
}

@end
