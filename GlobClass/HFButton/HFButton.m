//
//  HFButton.m
//  HFFrame
//
//  Created by jason on 12-11-18.
//  Copyright (c) 2012年 jason. All rights reserved.
//

#import "HFButton.h"

@implementation HFButton
@synthesize userInfo,index;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
    }
    return self;
}

-(void)setUserInfo:(id)_userInfo
{
    if (userInfo != _userInfo )
    {
        userInfo = [_userInfo copy];
    }
}
-(id)userInfo
{
    return userInfo ;
}
- (void)dealloc
{
    [userInfo release];
    [super dealloc];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
