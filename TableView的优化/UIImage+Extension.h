//
//  UIImage+Extension.h
//  TableView的优化
//
//  Created by James on 16/3/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  根据size来绘制一个与容器同等大小的图片
 *
 *  @param size size
 *
 *  @return image
 */
- (void)LJ_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor finishedBlock: (void(^)(UIImage *finishedImage))finished;
@end
