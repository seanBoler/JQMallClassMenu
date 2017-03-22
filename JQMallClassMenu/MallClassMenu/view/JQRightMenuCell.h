//
//  JQRightMenuCell.h
//  JQMallClassMenu
//
//  Created by tlkj on 17/3/21.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JQMenuModel;
@interface JQRightMenuCell : UICollectionViewCell

@property (nonatomic,strong)UIImageView *menuImage;
@property (nonatomic,strong)UILabel *menuTitle;
@property (nonatomic,strong)JQMenuModel *menuModel;
@end
