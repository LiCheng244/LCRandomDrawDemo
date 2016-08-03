//
//  ViewController.m
//  RandomDraw
//
//  Created by LiCheng on 16/8/3.
//  Copyright © 2016年 Li_Cheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, strong) NSMutableArray *names;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) BOOL isStart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.names = [NSMutableArray arrayWithObjects:@"刘一", @"陈二", @"张三", @"李四", @"王五", @"赵六", @"孙七", @"周八", @"吴九", @"郑十", @"刘一1", @"陈二1", @"张三1", @"李四1", @"王五1", @"赵六1", @"孙七1", @"周八1", @"吴九1", @"郑十1", nil];
}

#pragma mark - 每人只能抽一次
- (IBAction)changeNameClick:(id)sender {
    
    if (self.names.count != 0) {
    
        
        _isStart = !_isStart;
        
        if (_isStart) {
            
            [self.button setTitle:@"停止抽签" forState:(UIControlStateNormal)];
            
            self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(changeName) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
            
            
            
        }else{
            [self.button setTitle:@"开始抽签" forState:(UIControlStateNormal)];
            [_timer invalidate];
            
            // 如果要 限制每人只能抽取一次 要使用下面的代码
//            [self.names removeObjectAtIndex:self.index];
//            
//            for (NSString *name in self.names) {
//                NSLog(@"%@", name);
//            }
//            NSLog(@"%ld", self.nowNames.count);
        }
    }else{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"所有人都已抽到" preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
        
        [alert addAction:action];
        
        [self.navigationController pushViewController:alert animated:YES];
    }
}

- (void)changeName {
    
    if (self.names.count != 0) {
        NSInteger index = arc4random() % self.names.count;
        
        NSString *name = [self.names objectAtIndex:index];
        
        _nameL.text = name;
    }
}



@end
