//
//  DragSilderBar.m
//  dragsilderbar
//
//  Created by longkin on 15/3/3.
//  Copyright (c) 2015年 bluezsoft.inc. All rights reserved.
//

#import "DragSilderBarView.h"

#define BUTTONBACKCOLOR @"#FA967F"

@implementation DragSilderBarView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        sildeBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 4, self.bounds.size.width, 13)];
        sildeBackView.layer.borderWidth = 0.5;
        sildeBackView.layer.borderColor = [UIColor ColorFromHtml:@"#c5c5c5"].CGColor;
        sildeBackView.layer.cornerRadius = 6;
        //sildeBackView.clipsToBounds = YES;
        [self addSubview:sildeBackView];
        
        dragButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 21, 21)];
        //[dragButton setImage:[UIImage imageNamed:@"huakuai"] forState:UIControlStateNormal];
        dragButton.backgroundColor = [UIColor ColorFromHtml:BUTTONBACKCOLOR];
        dragButton.layer.cornerRadius = 10.5;
        dragButton.clipsToBounds = YES;
        [self addSubview:dragButton];
        
        NSLog(@"dragbutton center x %f,y %f",dragButton.center.x,dragButton.center.y);
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(doDragHandler:)];
        [dragButton addGestureRecognizer:pan];
        
    }
    return self;
}

-(void)doDragHandler:(UIPanGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
    }
    else
    {
        CGPoint translation = [recognizer translationInView:self];//相对坐标
        //将手势坐标转化为view坐标
        CGPoint recPointer = CGPointMake(recognizer.view.center.x + translation.x,dragButton.center.y);
        if (recPointer.x < dragButton.bounds.size.width / 2) {
            recPointer.x = dragButton.bounds.size.width / 2;
        }
        if (recPointer.x > self.bounds.size.width - dragButton.bounds.size.width / 2) {
            recPointer.x = self.bounds.size.width - dragButton.bounds.size.width / 2;
        }
        recognizer.view.center = recPointer;
        [recognizer setTranslation:CGPointZero inView:self];
        
        length = recPointer.x - dragButton.bounds.size.width / 2;
        _percent = length / (self.bounds.size.width - dragButton.bounds.size.width);
        [self setNeedsDisplay];
        
        if ([self.delegate respondsToSelector:@selector(dragSilderBar:forValue:)]) {
            [self.delegate dragSilderBar:self forValue:_percent];
        }
    }
}

-(void)setPercent:(CGFloat)percent
{
    _percent = percent;
    NSLog(@"self.value %f",self.percent);
    
    CGPoint center = dragButton.center;
    center.x = self.bounds.size.width * percent;
    dragButton.center = center;
    
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 8.0);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(ctx, [UIColor ColorFromHtml:BUTTONBACKCOLOR].CGColor);
    CGContextMoveToPoint(ctx, 7, dragButton.center.y);
    CGContextAddLineToPoint(ctx, dragButton.center.x - 7, dragButton.center.y);
    CGContextStrokePath(ctx);
}

@end
