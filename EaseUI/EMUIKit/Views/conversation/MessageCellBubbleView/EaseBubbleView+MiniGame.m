//
//  EaseBubbleView+MiniGame.m
//  EaseUI
//
//  Created by yuan yao on 2019/1/31.
//

#import "EaseBubbleView+MiniGame.h"

#define EaseColorFromHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

@implementation EaseBubbleView (MiniGame)

- (void)_setupMiniGameBubbleMarginConstraints
{
    [self.marginConstraints removeAllObjects];
    //添加小游戏图标约束
    NSLayoutConstraint *imageTopConstraints = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.marginConstraints addObject:imageTopConstraints];
    
    NSLayoutConstraint *imageRightConstraints = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-self.margin.right];
    [self.marginConstraints addObject:imageRightConstraints];
    
    NSLayoutConstraint *imageWidthConstraints = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:60];
    [self.marginConstraints addObject:imageWidthConstraints];

    NSLayoutConstraint *imageHeightConstraints = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:60];
    [self.marginConstraints addObject:imageHeightConstraints];

    //添加游戏描述约束
    NSLayoutConstraint *textTopConstraints = [NSLayoutConstraint constraintWithItem:self.textLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.marginConstraints addObject:textTopConstraints];
    
    NSLayoutConstraint *textRightConstraints = [NSLayoutConstraint constraintWithItem:self.textLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.imageView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-10];
    [self.marginConstraints addObject:textRightConstraints];
    
    NSLayoutConstraint *textLeftConstraints = [NSLayoutConstraint constraintWithItem:self.textLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:self.margin.left];
    [self.marginConstraints addObject:textLeftConstraints];
    //添加分割线的约束
    NSLayoutConstraint *lineBottomConstraints = [NSLayoutConstraint constraintWithItem:self.separateLineView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-32];
    [self.marginConstraints addObject:lineBottomConstraints];
    
    NSLayoutConstraint *lineRightConstraints = [NSLayoutConstraint constraintWithItem:self.separateLineView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-self.margin.right];
    [self.marginConstraints addObject:lineRightConstraints];

    NSLayoutConstraint *lineLeftConstraints = [NSLayoutConstraint constraintWithItem:self.separateLineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:self.margin.left];
    [self.marginConstraints addObject:lineLeftConstraints];
    
    NSLayoutConstraint *lineHeightConstraints = [NSLayoutConstraint constraintWithItem:self.separateLineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:1];
    [self.marginConstraints addObject:lineHeightConstraints];

    //添加箭头约束
    NSLayoutConstraint *arrowBottomConstraints = [NSLayoutConstraint constraintWithItem:self.arrowView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-11];
    [self.marginConstraints addObject:arrowBottomConstraints];
    
    NSLayoutConstraint *arrowRightConstraints = [NSLayoutConstraint constraintWithItem:self.arrowView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-self.margin.right];
    [self.marginConstraints addObject:arrowRightConstraints];
    
    NSLayoutConstraint *arrowWidthConstraints = [NSLayoutConstraint constraintWithItem:self.arrowView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:6];
    [self.marginConstraints addObject:arrowWidthConstraints];
    
    NSLayoutConstraint *arrowHeightConstraints = [NSLayoutConstraint constraintWithItem:self.arrowView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:11];
    [self.marginConstraints addObject:arrowHeightConstraints];

    //添加游戏标注约束
    NSLayoutConstraint *signBottomConstraints = [NSLayoutConstraint constraintWithItem:self.bottomLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.marginConstraints addObject:signBottomConstraints];
    
    NSLayoutConstraint *signRightConstraints = [NSLayoutConstraint constraintWithItem:self.bottomLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.arrowView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    [self.marginConstraints addObject:signRightConstraints];
    
    NSLayoutConstraint *signLeftConstraints = [NSLayoutConstraint constraintWithItem:self.bottomLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:self.margin.left];
    [self.marginConstraints addObject:signLeftConstraints];
    
    NSLayoutConstraint *signTopConstraints = [NSLayoutConstraint constraintWithItem:self.bottomLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.separateLineView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.marginConstraints addObject:signTopConstraints];

    [self addConstraints:self.marginConstraints];
    
}

- (void)_setupMiniGameBubbleConstraints
{
    [self _setupMiniGameBubbleMarginConstraints];
}

#pragma mark -public

- (void)setupMiniGameBubbleView
{
    //小游戏图标
    self.imageView = [[UIImageView alloc] init];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.layer.cornerRadius = 8;
    self.imageView.layer.masksToBounds = YES;
    [self.backgroundImageView addSubview:self.imageView];
    //游戏描述
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.accessibilityIdentifier = @"text_label";
    self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.numberOfLines = 0;
    [self.backgroundImageView addSubview:self.textLabel];
    
    //分割线
    UIView *separateLineView = [[UIView alloc] init];
    separateLineView.translatesAutoresizingMaskIntoConstraints = NO;
    separateLineView.backgroundColor = EaseColorFromHex(0xdddddd);
    [self.backgroundImageView addSubview:separateLineView];
    self.separateLineView = separateLineView;
    
    //小游戏标注
    UILabel *bottomLabel = [[UILabel alloc] init];
    bottomLabel.translatesAutoresizingMaskIntoConstraints = NO;
    bottomLabel.font = [UIFont systemFontOfSize:12];
    bottomLabel.textColor = EaseColorFromHex(0x999999);
    [self.backgroundImageView addSubview:bottomLabel];
    self.bottomLabel = bottomLabel;
    
    //箭头视图
    UIImageView *arrowView = [[UIImageView alloc] init];
    arrowView.translatesAutoresizingMaskIntoConstraints = NO;
    arrowView.image = [UIImage imageNamed:@"EaseUIResource.bundle/message_miniGame_arrow_icon"];
    [self.backgroundImageView addSubview:arrowView];
    self.arrowView = arrowView;
    
    [self _setupMiniGameBubbleConstraints];

}

- (void)updateMiniGameMargin:(UIEdgeInsets)margin
{
    if (_margin.top == margin.top && _margin.bottom == margin.bottom && _margin.left == margin.left && _margin.right == margin.right) {
        return;
    }
    _margin = margin;
    
    [self removeConstraints:self.marginConstraints];
    [self _setupMiniGameBubbleMarginConstraints];
}
@end
