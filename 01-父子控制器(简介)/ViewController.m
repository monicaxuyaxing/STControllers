//
//  ViewController.m
// 
#import "ViewController.h"

#import <Foundation/Foundation.h>

#import "SocietyViewController.h"
#import "TopLineViewController.h"
#import "HotViewController.h"

/*
    多控制器:当有很多控制器,交给一个大控制器管理
    父子控制器:导航控制器,UITabBarControler
    父子控制器本质:搞一个控制器容器,管理很多子控制器.
 
    模仿UITabBarControler,写一个自己的UITabBarControler,条在上面.
 
    任何控制器都可以是一个容器控制器.因为任何控制器都可以调用addChildViewController
 
    // UITabBarControler使用步骤
    // 1.显示UITabBarControler
    // 2.添加子控制器
 
    // ViewController
 */




@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *titleView;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController
- (IBAction)showVc:(UIButton *)sender {
    
    // 获取之前控制器的view
    UIView *firstView;
    if (self.contentView.subviews.count) {
       firstView  = self.contentView.subviews[0];
        
        
        
    }
    
    
    // 显示子控制器
    UIViewController *vc = self.childViewControllers[sender.tag];
    vc.view.frame = self.contentView.bounds;
    [self.contentView addSubview:vc.view];

    // 移除之前控制器的view
    [firstView removeFromSuperview];
}

// 父子控制器:如果A控制器的view添加到B控制器的view,A控制器就要成为B控制器子控制器

// 父子控制器:如果一个控制器的view显示,那么这个控制器必须存在
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.添加子控制器
    [self setUpAllChildViewController];
    // 2.设置按钮标题
    [self setUpButtonTitle];
}
// 设置按钮标题
- (void)setUpButtonTitle
{
    NSUInteger count = self.titleView.subviews.count;
    // 3
    // 0 1 2
    for (int i = 0; i < count; i++) {
        
        UIButton *btn = self.titleView.subviews[i];
        UIViewController *vc = self.childViewControllers[i];
        [btn setTitle:vc.title forState:UIControlStateNormal];
    }
}
// 添加子控制器
- (void)setUpAllChildViewController
{
    // 社会
    SocietyViewController *societyVc = [[SocietyViewController alloc] init];
    societyVc.title = @"社会";
    [self addChildViewController:societyVc];
    
    // 头条
    TopLineViewController *topLine = [[TopLineViewController alloc] init];
    topLine.title = @"头条";
    [self addChildViewController:topLine];
    
    // 热点
    HotViewController *hotVc = [[HotViewController alloc] init];
    hotVc.title = @"热点";
    [self addChildViewController:hotVc];
}

@end
