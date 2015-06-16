


//
//  MyView.m
//  QuarzDemo
//
//  Created by Mac-Pro on 15-3-6.
//  Copyright (c) 2015年 shy. All rights reserved.
//

#import "MyView.h"
#define PI 3.14159265358979323846

@implementation MyView

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

/**
 *  CGContextRef、CGPath、UIBezierPath
 *  Graphics Context是图形上下文,可以将其理解为一块画布,我们可以在上面进行绘画操作,绘制完成后,将画布放到我们的view中显示即可,view看作是一个画框
 *  @param rect
 *
 *  点:CGContextMoveToPoint
 * 线:CGContextAddLineToPoint
 * 面:
 */
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    //划线
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        
    
    }
    //三角形
    {
       CGContextRef context = UIGraphicsGetCurrentContext();
        //画一个点
        CGContextMoveToPoint(context, 75, 10);
        //划线
        CGContextAddLineToPoint(context, 10, 150);
        //划线
        CGContextAddLineToPoint(context, 160, 50);
        //封闭线
        CGContextClosePath(context);
        
        //设置一些属性
        [[UIColor blueColor] setStroke]; //设置描边的颜色
        [[UIColor yellowColor]setFill];  //填充色
        
        CGContextDrawPath(context, kCGPathFillStroke); //设置描绘路径方式
    
    }
    
    //写文字
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 1.0);
        CGContextSetRGBFillColor(context, 1, 0, 0, 1);
        NSDictionary *dict = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0]};
        [@"画圆：" drawInRect:CGRectMake(0, 160, 80, 20) withAttributes:dict];
    }
 
    //画圆
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetRGBFillColor(context, 1, 1, 1, 1.0);
        CGContextSetLineWidth(context, 1.0);
        /**
         *  x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
         */
        CGContextAddArc(context, 100, 160, 10, 0, 2*PI, 0);
        CGContextDrawPath(context, kCGPathStroke);
        
        
//        //填充圆，无边框
//        CGContextSetLineWidth(context, 1.0);
//        CGContextAddArc(context, 150, 180, 30, 0, 2*PI, 0); //添加一个圆
//        CGContextDrawPath(context, kCGPathFill);//绘制填充
    }
    
    /* */
    {
       CGContextRef context = UIGraphicsGetCurrentContext();
        //画大圆并填充颜
        UIColor*aColor = [UIColor colorWithRed:1 green:0.0 blue:0 alpha:1];
        CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
        CGContextSetLineWidth(context, 3.0);//线的宽度
        CGContextAddArc(context, 250, 40, 40, 0, PI, 1); //添加一个圆
        //kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
        CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充
    }
    
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        //画线
        CGPoint apoints[2];
        apoints[0] = CGPointMake(0, 190);
        apoints[1] = CGPointMake(150, 190);
        //CGContextAddLines(CGContextRef c, const CGPoint points[],size_t count)
        //points[]坐标数组，和count大小
        CGContextAddLines(context, apoints, 2);
//        CGContextDrawPath(context, kCGPathStroke);
        CGContextStrokePath(context);
    }

    {
        //画笑脸弧线
        //左
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);//改变画笔颜色
        CGContextMoveToPoint(context, 140, 80);//开始坐标p1
        //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
        //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
        CGContextAddArcToPoint(context, 148, 68, 156, 80, 10);
        CGContextStrokePath(context);//绘画路径
    }
    
    {
        //画矩形
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextStrokeRect(context, CGRectMake(0, 200, 60, 60));
        CGContextFillRect(context, CGRectMake(20, 200, 60, 60));
        
        //矩形，并填弃颜色
        CGContextSetLineWidth(context, 2.0);//线的宽度
        UIColor *aColor = [UIColor blueColor];//blue蓝色
        CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
        aColor = [UIColor redColor];
        CGContextSetStrokeColorWithColor(context, aColor.CGColor);//线框颜色
        CGContextAddRect(context,CGRectMake(140, 120, 60, 30));//画方框
        CGContextDrawPath(context, kCGPathFillStroke);//绘画路径

    }
   
    
    //矩形渐变色
    {
        //第一种
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = CGRectMake(240, 120, 60, 60);
        gradient.colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor,
                            (id)[UIColor grayColor].CGColor,
                            (id)[UIColor blackColor].CGColor,
                            (id)[UIColor yellowColor].CGColor,
                            (id)[UIColor blueColor].CGColor,
                            (id)[UIColor redColor].CGColor,
                            (id)[UIColor greenColor].CGColor,
                            (id)[UIColor orangeColor].CGColor,
                            (id)[UIColor brownColor].CGColor,nil];
        
        [self.layer insertSublayer:gradient atIndex:0];
        
        //第二种
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
        CGFloat colors[] =
        {
            1,1,1, 1.00,
            1,1,0, 1.00,
            1,0,0, 1.00,
            1,0,1, 1.00,
            0,1,1, 1.00,
            0,1,0, 1.00,
            0,0,1, 1.00,
            0,0,0, 1.00,
        };
        CGGradientRef gradientRef = CGGradientCreateWithColorComponents
        (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
        CGColorSpaceRelease(rgb);
        // 填充渐变色
        CGContextDrawLinearGradient(context, gradientRef, CGPointMake(0.0f, 0.0f), CGPointMake(60.0f, 60.0f), 0);
        
        // 释放渐变对象
        CGGradientRelease(gradientRef);
        
    }
    
    {
        //画扇形
        CGContextRef context = UIGraphicsGetCurrentContext();
        UIColor *aColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
        CGContextSetFillColorWithColor(context, aColor.CGColor);
        //以10为半径围绕圆心画指定角度扇形
        CGContextMoveToPoint(context, 160, 180);
        CGContextAddArc(context, 160, 180, 30, -60 *PI/180, -120*PI/180, 1);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke);
    }
    
    {
        //画椭圆
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddEllipseInRect(context, CGRectMake(160, 180, 30, 18));
    }
    
    {
        /*画圆角矩形*/
        CGContextRef context = UIGraphicsGetCurrentContext();
        float fw = 180;
        float fh = 280;
        
        CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右边开始
        CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10);  // 右下角角度
        CGContextAddArcToPoint(context, 120, fh, 120, fh-20, 10); // 左下角角度
        CGContextAddArcToPoint(context, 120, 250, fw-20, 250, 10); // 左上角
        CGContextAddArcToPoint(context, fw, 250, fw, fh-20, 10); // 右上角
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    }
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        /*画贝塞尔曲线*/
        //二次曲线
        CGContextMoveToPoint(context, 120, 300);//设置Path的起点
        CGContextAddQuadCurveToPoint(context,190, 310, 120, 390);//设置贝塞尔曲线的控制点坐标和终点坐标
        CGContextStrokePath(context);
        //三次曲线函数
        CGContextMoveToPoint(context, 200, 300);//设置Path的起点
        CGContextAddCurveToPoint(context,250, 280, 250, 400, 280, 300);//设置贝塞尔曲线的控制点坐标和控制点坐标终点坐标
        CGContextStrokePath(context);
    }
    {
        /*图片*/
        CGContextRef context = UIGraphicsGetCurrentContext();
        UIImage *image = [UIImage imageNamed:@"apple.jpg"];
        [image drawInRect:CGRectMake(60, 340, 20, 20)];//在坐标中画出图片
        //    [image drawAtPoint:CGPointMake(100, 340)];//保持图片大小在point点开始画图片，可以把注释去掉看看
        CGContextDrawImage(context, CGRectMake(100, 340, 20, 20), image.CGImage);//使用这个使图片上下颠倒了，参考http://blog.csdn.net/koupoo/article/details/8670024
        
        //    CGContextDrawTiledImage(context, CGRectMake(0, 0, 20, 20), image.CGImage);//平铺图
    }
}


@end
