//
//  EaseChatBarMoreBtn.m
//  EaseUI
//
//  Created by yuan yao on 2019/1/29.
//

#import "EaseChatBarMoreBtn.h"

#define EaseChatBarMoreBtnImageW 56

@implementation EaseChatBarMoreBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = (contentRect.size.width - EaseChatBarMoreBtnImageW)/2;
    CGFloat imageY = 0;
    return CGRectMake(imageX, imageY, EaseChatBarMoreBtnImageW, EaseChatBarMoreBtnImageW);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = EaseChatBarMoreBtnImageW + 7;
    CGFloat titleH = 13;
    return CGRectMake(0, titleY, contentRect.size.width, titleH);
}

@end
