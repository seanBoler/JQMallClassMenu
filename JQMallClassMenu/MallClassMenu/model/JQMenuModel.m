//
//  JQMenuModel.m
//  JQMallClassMenu
//
//  Created by tlkj on 17/3/21.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#import "JQMenuModel.h"

@implementation JQMenuClassModel
+(instancetype)menuClassModelWithDictionary:(NSDictionary *)dic{
    JQMenuClassModel *model = [[JQMenuClassModel alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%@",key);
}

-(NSMutableArray *)classArray{
    if (!_classArray) {
        _classArray = [NSMutableArray array];
    }
    return _classArray;
}

-(NSMutableArray *)sectionArray{
    if (!_sectionArray) {
        _sectionArray = [NSMutableArray array];
    }
    return _sectionArray;
}

-(NSArray *)array{
    if (!_array) {
    _array = @[
                       @{@"classTitle":@"果蔬",@"section":
                             @[@{@"sectionTitle":@"苹果",
                                 @"menuList":@[
                                         @{@"image":@"classinfo",@"menu":@"红富士",@"ID":@(12)},
                                         @{@"image":@"classinfo",@"menu":@"黑富士",@"ID":@(13)},
                                         @{@"image":@"classinfo",@"menu":@"蓝富士",@"ID":@(14)},
                                         @{@"image":@"classinfo",@"menu":@"白富士",@"ID":@(15)}
                                         ]},
                               @{@"sectionTitle":@"香蕉",
                                 @"menuList":@[
                                         @{@"image":@"classinfo",@"menu":@"大香蕉",@"ID":@(16)},
                                         @{@"image":@"classinfo",@"menu":@"黑香蕉",@"ID":@(17)},
                                         @{@"image":@"classinfo",@"menu":@"蓝香蕉",@"ID":@(18)},
                                         @{@"image":@"classinfo",@"menu":@"白香蕉",@"ID":@(19)}
                                         ]},
                               @{@"sectionTitle":@"banana",
                                 @"menuList":@[
                                         @{@"image":@"classinfo",@"menu":@"红富士",@"ID":@(10)},
                                         @{@"image":@"classinfo",@"menu":@"黑富士",@"ID":@(11)},
                                         @{@"image":@"classinfo",@"menu":@"蓝富士",@"ID":@(9)},
                                         @{@"image":@"classinfo",@"menu":@"白富士",@"ID":@(8)}
                                         ]}
                               ]},
                       
                       @{@"classTitle":@"面包",@"section":
                             @[@{@"sectionTitle":@"苹果",
                                 @"menuList":@[
                                         @{@"image":@"classinfo",@"menu":@"红富士",@"ID":@(12)},
                                         @{@"image":@"classinfo",@"menu":@"黑富士",@"ID":@(13)},
                                         @{@"image":@"classinfo",@"menu":@"蓝富士",@"ID":@(14)},
                                         @{@"image":@"classinfo",@"menu":@"白富士",@"ID":@(15)}
                                         ]},
                               @{@"sectionTitle":@"香蕉",
                                 @"menuList":@[
                                         @{@"image":@"classinfo",@"menu":@"大香蕉",@"ID":@(16)},
                                         @{@"image":@"classinfo",@"menu":@"黑香蕉",@"ID":@(17)},
                                         @{@"image":@"classinfo",@"menu":@"蓝香蕉",@"ID":@(18)},
                                         @{@"image":@"classinfo",@"menu":@"白香蕉",@"ID":@(19)}
                                         ]},

                               ]},
                       
                       
                       @{@"classTitle":@"banana",@"section":
                             @[@{@"sectionTitle":@"苹果",
                                 @"menuList":@[
                                         @{@"image":@"classinfo",@"menu":@"红富士",@"ID":@(12)},
                                         @{@"image":@"classinfo",@"menu":@"黑富士",@"ID":@(13)},
                                         @{@"image":@"classinfo",@"menu":@"蓝富士",@"ID":@(14)},
                                         @{@"image":@"classinfo",@"menu":@"白富士",@"ID":@(15)}
                                         ]},

                               @{@"sectionTitle":@"banana",
                                 @"menuList":@[
                                         @{@"image":@"classinfo",@"menu":@"红富士",@"ID":@(10)},
                                         @{@"image":@"classinfo",@"menu":@"黑富士",@"ID":@(11)},
                                         @{@"image":@"classinfo",@"menu":@"蓝富士",@"ID":@(9)},
                                         @{@"image":@"classinfo",@"menu":@"白富士",@"ID":@(8)}
                                         ]}
                               ]},
                       ];
    }
    return _array;
}

-(void)loadDataIncludedBlock:(void (^)(NSArray *))sucess faildBlock:(void (^)())faild{
   
    
    for (NSMutableDictionary *classDic in self.array) {
        JQMenuClassModel *model = [JQMenuClassModel menuClassModelWithDictionary:classDic];
        [self.classArray addObject:model];
        NSArray *sectionArray =  classDic[@"section"];
        for (NSMutableDictionary *sectionDic in sectionArray) {
            JQSectionTitleModel *sectionModel  = [JQSectionTitleModel sectionTitleModelWithDictionary:sectionDic];
            NSArray *menuArray = sectionDic[@"menuList"];
            [model.sectionArray addObject:sectionModel];
            for (NSMutableDictionary *menuDic in menuArray) {
                JQMenuModel *menuModel = [JQMenuModel menuModelWithDictionary:menuDic];
                [sectionModel.menuArray addObject:menuModel];
            }
        }
    }
    
                if (sucess) {
                    sucess(self.classArray.copy);
                }
    
}

@end


@implementation JQSectionTitleModel
+(instancetype)sectionTitleModelWithDictionary:(NSDictionary *)dictionary{
    JQSectionTitleModel *model = [[JQSectionTitleModel alloc]init];
    [model setValuesForKeysWithDictionary:dictionary];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%@",key);

}
-(NSMutableArray *)menuArray{
    if (!_menuArray) {
        _menuArray = [NSMutableArray array];
    }
    return _menuArray;
}

@end


@implementation JQMenuModel

+(instancetype)menuModelWithDictionary:(NSDictionary *)dictionary{
    JQMenuModel *model = [[JQMenuModel alloc]init];
    [model setValuesForKeysWithDictionary:dictionary];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%@",key);

}
@end
