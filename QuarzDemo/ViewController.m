//
//  ViewController.m
//  QuarzDemo
//
//  Created by Mac-Pro on 15-3-6.
//  Copyright (c) 2015年 shy. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "CustomView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self sanjiaoShape];
    
}



#pragma mark -绘制基本几何图形
/*
 * 基于路径的绘图，透明度绘图，遮盖，阴影，透明层，颜色管理，防锯齿渲染，
 */


//1.Quartz

//三角形
- (void)sanjiaoShape
{
//    MyView *myView = [[MyView alloc]initWithFrame:self.view.frame];
    CustomView *myView = [[CustomView alloc]initWithFrame:self.view.frame];
    myView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:myView];
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
