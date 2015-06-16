





//
//  CustomView.m
//  QuarzDemo
//
//  Created by Mac-Pro on 15-3-6.
//  Copyright (c) 2015年 shy. All rights reserved.
//

#import "CustomView.h"
#define RADIANS(i)  M_PI*i/180


@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //绘制虚线
//    [self drawLineDash];
    [self drawPie];
    
    
}

- (void)drawLineDash
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetLineDash(context, 0, (CGFloat[]){10, 5}, 2);//绘制10个跳过5个
    CGContextSetStrokeColorWithColor(context, [[UIColor brownColor] CGColor]);
    CGContextMoveToPoint(context, 0, 20);
    CGContextAddLineToPoint(context, 320, 20);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

void drawPieChart(CGContextRef context, CGPoint point, float start_angel, float end_angle, double radius, CGColorRef color)
{
    CGContextMoveToPoint(context, point.x, point.y);
    CGContextSetFillColorWithColor(context, color);
    CGContextAddArc(context, point.x, point.y, radius, start_angel, end_angle, 0);
    CGContextFillPath(context);
}

//绘制饼图
- (void)drawPie
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetShadow(context, CGSizeMake(0, 10), 10); //简单的设置了一个阴影
    double radius = 120;
    
    float start = RADIANS(0);
    float end = RADIANS(120);
    drawPieChart(context, self.center, start, end, radius, [[UIColor orangeColor] CGColor]);
    
    start = end;
    end = RADIANS(194);
    drawPieChart(context, self.center, start, end, radius, [[UIColor yellowColor] CGColor]);
    
    start = end;
    end = RADIANS(231);
    drawPieChart(context, self.center, start, end, radius, [[UIColor purpleColor] CGColor]);
    
    start = end;
    end = RADIANS(360);
    drawPieChart(context, self.center, start, end, radius, [[UIColor blueColor] CGColor]);
    
    CGContextRestoreGState(context);
}

@end
