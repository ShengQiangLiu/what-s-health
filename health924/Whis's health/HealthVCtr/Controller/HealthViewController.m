//
//  HealthViewController.m
//  What's health
//
//  Created by apple on 14-9-23.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HealthViewController.h"
#import "NewsTableViewCell.h"
#import "MyScrollView.h"
#import "Configuration.h"
@interface HealthViewController ()<UITableViewDataSource,UITableViewDelegate,MyScrollViewDataSource,MyScrollViewDelegate>
{
    UITableView *_tableView;
    MyScrollView *_myScrollView;
    UIPageControl *_pageCtr;
}
@end

@implementation HealthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
}

- (void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, kWidth, kHeight-49-44-40) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = [self createTableViewHeader];
    [_tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
}

- (UIView *)createTableViewHeader
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth,140)];
    
    _myScrollView = [[MyScrollView alloc]initWithFrame:CGRectMake(0, 0, kWidth,140)];
    _myScrollView.delegate = self;
    _myScrollView.dataSource = self;
    [headView addSubview:_myScrollView];
    
    _pageCtr = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 120, kWidth, 20)];
    
#ifdef DEBUG
    _pageCtr.numberOfPages = 3;
#endif
    [headView addSubview:_pageCtr];
    return headView;
}

#pragma mark-myscrollDelegate
- (NSInteger)numberOfPageInScrollView:(MyScrollView *)scrollView
{
    return 3;
}

- (UIView *)scrollView:(MyScrollView *)scrollView viewAtIndex:(NSInteger)index
{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2.jpg"]];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 140 - 45, self.view.frame.size.width, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    label.text = @"横条新闻";
    [imgView addSubview:label];
    return imgView;
}

- (void)scrollView:(MyScrollView *)scrollView didSelectAtIndex:(NSInteger)index
{
    NSLog(@"%d",index);
}

- (void)scrollViewDidEndScroll:(MyScrollView *)scrollView
{
    _pageCtr.currentPage = scrollView.currentPage;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.lable1.text = @"title";
    cell.lable2.text = @"xiangqing";
    cell.lable3.text = @"dianzan";
    cell.imageView1.image = [UIImage imageNamed:@"2.jpg"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
