//
//  CycleScrollView.h
//  CycleScrollDemo
//
//  Created by Weever Lu on 12-6-14.
//  Copyright (c) 2012年 linkcity. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CycleDirectionPortait,          // 垂直滚动
    CycleDirectionLandscape         // 水平滚动
}CycleDirection;

@protocol CycleScrollViewDelegate;

@interface CycleScrollView : UIView <UIScrollViewDelegate> {
    int totalPage;  
    int curPage;
    CGRect scrollFrame;
    
    CycleDirection scrollDirection;     // scrollView滚动的方向
    NSMutableArray *imagesArray;               // 存放所有需要滚动的图片 UIImage
    NSMutableArray *curImages;          // 存放当前滚动的三张图片
    
    id delegate;
}

@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) NSMutableArray *imagesArray;               // 存放所有需要滚动的图片 UIImage
@property (nonatomic, retain)  NSMutableArray *curImages;
@property (nonatomic, retain)  UIImageView *curImageView;


- (int)validPageValue:(NSInteger)value;
- (id)initWithFrame:(CGRect)frame cycleDirection:(CycleDirection)direction pictures:(NSMutableArray *)pictureArray;
- (NSMutableArray *)getDisplayImagesWithCurpage:(int)page;
- (void)refreshScrollView;

@end

@protocol CycleScrollViewDelegate <NSObject>
@optional
- (void)cycleScrollViewDelegate:(CycleScrollView *)cycleScrollView didSelectImageView:(int)index;
- (void)cycleScrollViewDelegate:(CycleScrollView *)cycleScrollView didScrollImageView:(int)index;

@end