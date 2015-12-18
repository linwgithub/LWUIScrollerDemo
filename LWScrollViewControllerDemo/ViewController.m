//
//  ViewController.m
//  LWScrollViewControllerDemo
//
//  Created by linw on 15/12/18.
//  Copyright © 2015年 linw. All rights reserved.
//

#import "ViewController.h"
    
@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加scrollView控件
    _scrollerView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    _scrollerView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:_scrollerView];
    
    //添加图片控件
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"demo.png"]];
    [_scrollerView addSubview:_imageView];
    
    //内容大小设置
    _scrollerView.contentSize = _imageView.frame.size;
    
    //缩放比例设置
    _scrollerView.minimumZoomScale = 0.6;
    _scrollerView.maximumZoomScale = 3.0;
    //隐藏滚动条
    _scrollerView.showsHorizontalScrollIndicator=NO;
    _scrollerView.showsVerticalScrollIndicator=NO;
    

    //设置代理
    _scrollerView.delegate = self;
}

#pragma mark 实现缩放视图代理方法，不实现此方法无法缩放
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imageView;
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDecelerating");
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating");
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging");
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging");
}
-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    NSLog(@"scrollViewWillBeginZooming");
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"scrollViewDidEndZooming");
}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewDidScroll");
//}

#pragma mark 当图片小于屏幕宽高时缩放后让图片显示到屏幕中间
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGSize originalSize=_scrollerView.bounds.size;
    CGSize contentSize=_scrollerView.contentSize;
    CGFloat offsetX=originalSize.width>contentSize.width?(originalSize.width-contentSize.width)/2:0;
    CGFloat offsetY=originalSize.height>contentSize.height?(originalSize.height-contentSize.height)/2:0;
    
    _imageView.center=CGPointMake(contentSize.width/2+offsetX, contentSize.height/2+offsetY);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
