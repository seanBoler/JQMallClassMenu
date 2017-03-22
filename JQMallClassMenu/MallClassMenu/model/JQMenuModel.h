//
//  JQMenuModel.h
//  JQMallClassMenu
//
//  Created by tlkj on 17/3/21.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JQMenuClassModel : NSObject
@property (nonatomic,copy)NSString *classTitle;

+(instancetype)menuClassModelWithDictionary:(NSDictionary *)dictionary;
@property (nonatomic,strong)NSMutableArray *classArray;
@property (nonatomic,strong)NSMutableArray *sectionArray;

-(void)loadDataIncludedBlock:(void(^)(NSArray *modelArr))sucess faildBlock:(void(^)())faild;
@property (nonatomic,strong)NSArray *array;


@end

@interface JQSectionTitleModel : NSObject
@property (nonatomic,copy)NSString *sectionTitle;

+(instancetype)sectionTitleModelWithDictionary:(NSDictionary *)dictionary;
@property (nonatomic,strong)NSMutableArray *menuArray;

@end

@interface JQMenuModel : NSObject
@property (nonatomic,copy)NSString *image;
@property (nonatomic,copy)NSString *menu;
@property (nonatomic,assign)NSInteger ID;
+(instancetype)menuModelWithDictionary:(NSDictionary *)dictionary;

@end
