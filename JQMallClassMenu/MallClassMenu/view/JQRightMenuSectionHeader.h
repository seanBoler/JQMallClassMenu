//
//  JQRightMenuSectionHeader.h
//  JQMallClassMenu
//
//  Created by tlkj on 17/3/21.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JQSectionTitleModel;
@interface JQRightMenuSectionHeader : UICollectionReusableView

@property (nonatomic,strong)UILabel *sectionTitle;
@property (nonatomic,strong)UIView *line;

//- (void) setLabelText:(NSString *)text;
@property (nonatomic,strong)JQSectionTitleModel *sectionModel;
@end
