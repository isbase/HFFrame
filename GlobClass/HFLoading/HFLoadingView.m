//
//  HFLoading.m
//  HFFrame
//
//  Created by jason on 12-11-28.
//  Copyright (c) 2012年 jason. All rights reserved.
//

#import "HFLoadingView.h"
#import "HFAnimation.h"

@implementation HFLoadingView
@synthesize customView,imageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.customView = [[[NSBundle mainBundle] loadNibNamed:@"HFLoadingView" owner:self options:nil]objectAtIndex:0];
        [self customInit];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [self initWithCoder:aDecoder])
    {
        self.customView = [[[NSBundle mainBundle] loadNibNamed:@"HFLoadingView" owner:self options:nil]objectAtIndex:0];
        [self customInit];
    }
    return self;
}

-(void)customInit
{
//    self.backgroundColor = [UIColor blackColor];
    [self setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    self.imageView =(UIImageView*) [customView viewWithTag:11];
//    [self.imageView setImage:[UIImage imageNamed:@"loading01.png"]];
    NSArray *arry = [NSArray arrayWithObjects:
                     [UIImage imageNamed:@"loading01.png"],
                     [UIImage imageNamed:@"loading02.png"],
                     [UIImage imageNamed:@"loading03.png"],
                     [UIImage imageNamed:@"loading04.png"],
                     [UIImage imageNamed:@"loading05.png"],
                     nil];
    [imageView setAnimationImages:arry];
    [imageView setAnimationDuration:0.5];
    [imageView setAnimationRepeatCount:1000];
    [imageView startAnimating];
    [self addSubview:customView];
}



//- (void)layoutSubviews
//{
//    CGSize viewsize = self.frame.size;
////    float bothwidth = spinnersize.width + textsize.width + 5.0f;
////    CGRect containrect = {
////        CGPointMake(floorf((viewsize.width / 2) - (bothwidth / 2)), floorf((viewsize.height / 2) - (spinnersize.height / 2))),
////        CGSizeMake(bothwidth, spinnersize.height)
////    };
//}

#pragma mark -
#pragma mark Class methods
+ (HFLoadingView *)showLoadingViewAddedTo:(UIView *)view title:(NSString*)title {
	HFLoadingView *loadingView = [[HFLoadingView alloc] initWithFrame:view.bounds];
	[view addSubview:loadingView];
    if (TTIsStringWithAnyText(title))
    {
        MTAnimatedLabel *label = (MTAnimatedLabel*)[loadingView.customView viewWithTag:12];
        label.text = title;
        [label startAnimating];
    }
    loadingView.customView.center = CGPointMake(
                                       (view.width)/2.0,
                                       (view.height)/2.0);
	return [loadingView autorelease];
}

+ (void)hideLoadingViewForView:(UIView *)view {
	for (UIView *v in [view subviews]) {
		if ([v isKindOfClass:[HFLoadingView class]]) {
            [v removeFromSuperview];
            break;
		}
	}
}

#pragma mark -


- (void)dealloc
{
    TTIsStringWithAnyText(customView);
    TTIsStringWithAnyText(imageView);
    [super dealloc];
}
@end
