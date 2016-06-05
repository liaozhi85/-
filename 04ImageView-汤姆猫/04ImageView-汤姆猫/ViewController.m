//
//  ViewController.m
//  04ImageView-汤姆猫
//
//  Created by 廖 廖智 on 16/1/6.
//  Copyright © 2016年 廖 廖智. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)animation;
- (IBAction)dayun;
- (void)runAnimation:(int)number fileName:(NSString *)name;

@end
/*
 ImageView 的ainimationImage属性实现序列化动画。
 */
@implementation ViewController
- (void)runAnimation:(int)number fileName:(NSString *)name {
    NSMutableArray *arrayImage = [[NSMutableArray alloc] init];
    NSBundle *bundle = [NSBundle mainBundle];
    
    for (int i=0; i<number; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%@_%02d.jpg",name,i];
        NSString *path = [bundle pathForResource:fileName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [arrayImage addObject:image];
    }
    _imageView.animationImages = arrayImage;
    _imageView.animationRepeatCount = 1;
    _imageView.animationDuration = arrayImage.count * 0.05;
    [_imageView startAnimating];
    CGFloat delay = _imageView.animationDuration + 0.05;
    [self.imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:delay];

}


- (IBAction)animation {
    if ([_imageView isAnimating]) {
        return;
    }
    [self runAnimation:81 fileName:@"drink"];
}

- (IBAction)dayun {
    if ([_imageView isAnimating]) {
        return;
    }
    [self runAnimation:81 fileName:@"knockout"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
