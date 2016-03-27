//
//  UIImage+Extension.m
//  TableView的优化
//
//  Created by James on 16/3/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

- (void)LJ_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor finishedBlock:(void (^)(UIImage *))finished {
    
    //子线程中进行耗时操作
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //利用绘图,建立上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        CGRect rect = CGRectMake(0, 0, size.width , size.height);
        
        //设置填充色
        [fillColor setFill];
        UIRectFill(rect);
        
        //利用贝塞尔路径裁切效果
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        [path addClip];
        
        //绘制图像
        [self drawInRect:rect];
        
        //取得结果
        UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
        
        //关闭上下文
        UIGraphicsEndImageContext();
        
        //回主线程完成回调
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finished) {
                
                finished(resultImage);
            }
        });
    });
}
@end
