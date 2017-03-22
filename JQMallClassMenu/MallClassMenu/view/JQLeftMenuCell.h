//
//  JQLeftMenuCell.h
//  JQMallClassMenu
//
//  Created by tlkj on 17/3/21.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JQMenuClassModel;
@interface JQLeftMenuCell : UITableViewCell
@property (nonatomic,strong)UILabel *lineLogo;
@property (nonatomic,strong)UILabel *menuClass;

-(void)configCellWithTitle:(NSString *)str andIndexPath:(NSIndexPath *)indexPath andSelectIndexPath:(NSIndexPath *)selectIndexPath;

@property (nonatomic,strong)JQMenuClassModel *classModel;
@end
