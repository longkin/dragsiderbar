//
//  ViewController.m
//  dragsilderbar
//
//  Created by longkin on 15/3/3.
//  Copyright (c) 2015年 bluezsoft.inc. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    DragSilderBarView *dragbar = [[DragSilderBarView alloc] initWithFrame:CGRectMake(50, 60, 200, 20)];
    dragbar.delegate = self;
    [self.view addSubview:dragbar];
    
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(150, 90, 100, 20)];
    lbl.text = @"0%";
    [self.view addSubview:lbl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dragSilderBar:(DragSilderBarView *)view forValue:(CGFloat)percent{

    lbl.text = [NSString stringWithFormat:@"%.0f%%",percent*100];
}

@end
