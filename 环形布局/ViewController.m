//
//  ViewController.m
//  环形布局
//
//  Created by 曾凡怡 on 2016/11/13.
//  Copyright © 2016年 曾凡怡. All rights reserved.
//

#import "ViewController.h"
#import "ZFRoundLayout.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)NSMutableArray *count;

@property(nonatomic,strong)ZFRoundLayout * layout;

@property(nonatomic,weak)UICollectionViewFlowLayout * flowLayout;

@property(nonatomic,weak)UICollectionView * cv;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupUI];
}

- (NSMutableArray *)count
{
    if (_count == nil) {
        _count = [NSMutableArray array];
        for (int i = 0; i < 20; i ++) {
            [_count addObject:@""];
        }
    }
    return _count;
}


/**
 设置UI界面
 */
- (void)setupUI
{
    ZFRoundLayout *layout = [[ZFRoundLayout alloc]init];
    UICollectionViewFlowLayout *flowLayout =  [UICollectionViewFlowLayout new];
    self.layout = layout;
    self.flowLayout = flowLayout;
    
    UICollectionView *cv = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300) collectionViewLayout:layout];
    
    [cv registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    cv.delegate = self;
    cv.dataSource = self;
    
    [self.view addSubview:cv];
    
    self.cv = cv;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.count.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    
    return cell;
}


//删除cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    [self.count removeObjectAtIndex:indexPath.item];

    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
    
//    [collectionView setCollectionViewLayout:self.currentLayout animated:YES];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    
    CGPoint touchPoint = [touch locationInView:self.view];
    
    if (touchPoint.y > 300) {
        [self.cv setCollectionViewLayout:_flowLayout animated:YES];
    }
}

@end
