//
//  RoundLayout.m
//  环形布局
//
//  Created by 曾凡怡 on 2016/11/13.
//  Copyright © 2016年 曾凡怡. All rights reserved.
//

#import "ZFRoundLayout.h"

@implementation ZFRoundLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 获取cell的个数
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
   
    
    
    // 创建可变数组
    NSMutableArray *arrM = [NSMutableArray array];
    
    
    for (int i = 0; i < count; i++) {
        // 实例化布局对象
        
        //实例化indexPath
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        //获取中心点
        CGPoint center = CGPointMake(self.collectionView.bounds.size.width/2, self.collectionView.bounds.size.height/2);
        
        //
        CGFloat radius = 125;
        
        //角度
        CGFloat angle = M_PI * 2 / count;

        CGFloat centerX = center.x + sin(angle * i) * radius;
        CGFloat centerY = center.y - cos(angle * i) * radius;
        
        
        //设置bounds
        attribute.bounds = CGRectMake(0, 0, 50, 50);
        
        attribute.center = CGPointMake(centerX,centerY);
        
        
        //添加到可变数组
        [arrM addObject:attribute];
    }
    
    
    return arrM;
    
}

@end
