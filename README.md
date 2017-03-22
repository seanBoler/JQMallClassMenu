# JQMallClassMenu
三级/二级列表 三层model 商城列表分类


## ---- tableView  与 collectionView 联动



三层model 设置



如需要接口获取网络图片 请自行添加SDWebImage
  
# JQRightMenuCell.h
  
      -(void)setMenuModel:(JQMenuModel *)menuModel{
         _menuModel = menuModel;
          _menuTitle.text = [NSString stringWithFormat:@"%@",menuModel.menu];
          _menuImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",menuModel.image]];
      }



![image](https://github.com/seanBoler/JQMallClassMenu/blob/master/JQMallClassMenu/classMall.gif)
