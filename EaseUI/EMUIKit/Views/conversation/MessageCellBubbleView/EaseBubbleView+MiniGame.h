//
//  EaseBubbleView+MiniGame.h
//  EaseUI
//
//  Created by yuan yao on 2019/1/31.
//

#import "EaseBubbleView.h"

NS_ASSUME_NONNULL_BEGIN

@interface EaseBubbleView (MiniGame)

/*!
 @method
 @brief 构建小游戏类型消息气泡视图
 */
- (void)setupMiniGameBubbleView;

/*!
 @method
 @brief 变更小游戏类型消息气泡的边距，并更新改子视图约束
 @param margin 气泡边距
 */
- (void)updateMiniGameMargin:(UIEdgeInsets)margin;

@end

NS_ASSUME_NONNULL_END
