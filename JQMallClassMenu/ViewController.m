//
//  ViewController.m
//  JQMallClassMenu
//
//  Created by tlkj on 17/3/21.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#import "ViewController.h"
#import "JQLeftMenuCell.h"
#import "JQRightMenuCell.h"
#import "JQRightMenuSectionHeader.h"
#import "JQMenuModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UICollectionView *collectionView;

//获取tableviewcell 数据点击样式
@property (strong, nonatomic) NSIndexPath *selectIndex;
//根据左菜单indexPath获取collection的数据
@property (nonatomic,assign)int RCinteger;

@property (nonatomic,strong)NSMutableArray *liftArray;

@end

@implementation ViewController

static NSString * const liftTableView = @"liftTableView";
static NSString * const rightCollectionView = @"rightCollectionView";
static NSString * const rightMenuHeader = @"rightMenuHeader";


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collectionView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)liftArray{
    if (!_liftArray) {
        JQMenuClassModel *classModel = [[JQMenuClassModel alloc]init];
        [classModel loadDataIncludedBlock:^(NSArray *modelArr) {
            _liftArray = [NSMutableArray arrayWithArray:modelArr];
            [self.tableView reloadData];
        } faildBlock:^{
            
        }];
    }
    return _liftArray;
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 90, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGBACOLOR(241, 242, 243, 1);
        [_tableView registerClass:[JQLeftMenuCell class] forCellReuseIdentifier:liftTableView];
    }
    return _tableView;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        //创建flowlayout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //设置行之间的最小间隔
        layout.minimumLineSpacing = 5;
        //设置列之间的最小间隔
        layout.minimumInteritemSpacing = 5;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //创建collectionview对象，设置代理，设置数据源
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(90, 0, SCREEN_WIDTH - 90 - 12, SCREEN_HEIGHT) collectionViewLayout:layout];
        //    self.collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.backgroundColor = [UIColor whiteColor];
        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[JQRightMenuCell class] forCellWithReuseIdentifier:rightCollectionView];
        [_collectionView registerClass:[JQRightMenuSectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:rightMenuHeader];
    }
    return _collectionView;
}



#pragma mark -- tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 43;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.liftArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JQLeftMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:liftTableView forIndexPath:indexPath];
    ///改变字体颜色及显示线
    [cell configCellWithTitle:[self.liftArray objectAtIndex:indexPath.row] andIndexPath:indexPath andSelectIndexPath:self.selectIndex];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    JQMenuClassModel *model = self.liftArray[indexPath.row];
    cell.classModel = model;
    return cell;
}

#pragma mark -设置cell的线到顶端
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
    //设置点击改变颜色
    self.selectIndex = indexPath;
    [self.tableView reloadData];
    
    [self.collectionView scrollRectToVisible:CGRectMake(0, 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height) animated:YES];
    self.RCinteger =(int)indexPath.row;
    [self.collectionView reloadData];

}

#pragma mark --设置collectionDelegate
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH- 112)/3 - 10,((SCREEN_WIDTH- 112)/3 - 10)+20);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    JQMenuClassModel *classModel = self.liftArray[self.RCinteger];
    
    return classModel.sectionArray.count;
}
/*
 *headerView
 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        JQRightMenuSectionHeader * secview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:rightMenuHeader forIndexPath:indexPath];

        JQMenuClassModel *classModel = self.liftArray[self.RCinteger];
           JQSectionTitleModel *sectionModel =  classModel.sectionArray[indexPath.section];
        secview.sectionModel = sectionModel;
        return secview;
    }
    return nil;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(collectionView.frame.size.width, 30);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    JQMenuClassModel *classModel = self.liftArray[self.RCinteger];
    JQSectionTitleModel *sectionModel =  classModel.sectionArray[section];
    
    return sectionModel.menuArray.count;
}

/*
 *根据左分类collection数据 显示
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JQRightMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rightCollectionView forIndexPath:indexPath];
    JQMenuClassModel *classModel = self.liftArray[self.RCinteger];
    JQSectionTitleModel *sectionModel =  classModel.sectionArray[indexPath.section];
    JQMenuModel *menuModel = sectionModel.menuArray[indexPath.row];
    cell.menuModel = menuModel;
    return cell;
}

#pragma mark <UICollectionViewDelegate> //collection cell 点击进入商品详情页
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    JQMenuClassModel *classModel = self.liftArray[self.RCinteger];
    JQSectionTitleModel *sectionModel =  classModel.sectionArray[indexPath.section];
    JQMenuModel *menuModel = sectionModel.menuArray[indexPath.row];
    
    NSLog(@"这里处理菜单的点击事件ID%ld",(long)menuModel.ID);
}



@end
