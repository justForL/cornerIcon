//
//  ViewController.m
//  TableView的优化
//
//  Created by James on 16/3/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //新建一个redView
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    //设置imageView的image并居中
    UIImage *image = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"avatar" ofType:@"jpg"]];
    imageView.center = self.view.center;
    
    //添加到父控件上
    [self.view addSubview:imageView];
    
    //设置圆角
//    imageView.layer.cornerRadius = imageView.bounds.size.width * 0.5;
//    imageView.layer.masksToBounds = YES;
    [image LJ_cornerImageWithSize:CGSizeMake(imageView.bounds.size.width, imageView.bounds.size.height) fillColor:[UIColor whiteColor] finishedBlock:^(UIImage *finishedImage) {
        imageView.image = finishedImage;
    }];
    
    
    
    
}



@end
