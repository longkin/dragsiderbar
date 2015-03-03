//
//  DragSilderBar.h
//  dragsilderbar
//
//  Created by longkin on 15/3/3.
//  Copyright (c) 2015年 bluezsoft.inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+HTML.h"


@protocol DragSilderBarDelegate;

/***********************************************************************************************/

@interface DragSilderBarView : UIControl
{
@private
    UIButton *dragButton;
    UIView *sildeBackView;
    CGFloat length;
}

@property (nonatomic) CGFloat percent;//百分比
@property (nonatomic,assign) id<DragSilderBarDelegate> delegate;

@end

/***********************************************************************************************/

@protocol DragSilderBarDelegate <NSObject>

@optional
-(void)dragSilderBar:(DragSilderBarView *)view forValue:(CGFloat)percent;


@end