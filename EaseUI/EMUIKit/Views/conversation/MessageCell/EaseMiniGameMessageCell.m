//
//  EaseMiniGameMessageCell.m
//  EaseUI
//
//  Created by yuan yao on 2019/1/30.
//

#import "EaseMiniGameMessageCell.h"
#import "UIImageView+WebCache.h"
#import "EaseBubbleView+MiniGame.h"

@implementation EaseMiniGameMessageCell

+ (void)initialize
{
    // UIAppearance Proxy Defaults

    
}


#pragma mark - IModelCell

- (BOOL)isCustomBubbleView:(id<IMessageModel>)model
{
    return YES;
}

- (void)setCustomModel:(id<IMessageModel>)model
{
    NSString *iconUrl = [model.message.ext objectForKey:@"extIcon"];
    NSString *signStr = [model.message.ext objectForKey:@"extSign"];
    NSString *titleStr = [model.message.ext objectForKey:@"extTitle"];
    NSString *desStr = [model.message.ext objectForKey:@"extDes"];
    
    
    [self.bubbleView.imageView sd_setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:[UIImage imageNamed:model.failImageName]];
    self.bubbleView.bottomLabel.text = signStr;
    self.bubbleView.textLabel.attributedText = [EaseMiniGameMessageCell getStrWithFirStr:[NSString stringWithFormat:@"%@\n",titleStr] secStr:desStr];
    
    if (model.avatarURLPath) {
        [self.avatarView sd_setImageWithURL:[NSURL URLWithString:model.avatarURLPath] placeholderImage:model.avatarImage];
    } else {
        self.avatarView.image = model.avatarImage;
    }
}


+ (NSMutableAttributedString *)getStrWithFirStr:(NSString *)firStr secStr:(NSString *)secStr
{
    NSInteger frontLength = firStr.length;//前面文字的长度
    NSInteger backLength = secStr.length;//后面文字的长度
    NSInteger allLength = frontLength + backLength;//文字的总长度
    
    //设置行间距
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.paragraphSpacing = 10;
    paragraph.lineSpacing = 2;

    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",firStr,secStr]];
    [attStr addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, allLength)];
    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, frontLength)];
    [attStr addAttribute:NSForegroundColorAttributeName value:EaseColorFromHex(0x999999) range:NSMakeRange(frontLength, backLength)];
    
    [attStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:18]  range:NSMakeRange(0, frontLength)];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(frontLength, backLength)];
    return attStr;
}


- (void)setCustomBubbleView:(id<IMessageModel>)model
{
    
    [_bubbleView setupMiniGameBubbleView];

}

- (void)updateCustomBubbleViewMargin:(UIEdgeInsets)bubbleMargin model:(id<IMessageModel>)model
{
    bubbleMargin = model.isSender ? UIEdgeInsetsMake(0, 15, 0, 20) : UIEdgeInsetsMake(0, 20, 0, 12);
    
    [_bubbleView updateMiniGameMargin:bubbleMargin];
    
}

/*!
 @method
 @brief 获取cell的重用标识
 @param model   消息model
 @return 返回cell的重用标识
 */
+ (NSString *)cellIdentifierWithModel:(id<IMessageModel>)model
{
    return model.isSender?@"EaseMiniGameMessageSendCell":@"EaseMiniGameMessageRecCell";
}

/*!
 @method
 @brief 获取cell的高度
 @param model   消息model
 @return  返回cell的高度
 */
+ (CGFloat)cellHeightWithModel:(id<IMessageModel>)model
{
    if (model.cellHeight > 0) {
        return model.cellHeight;
    }
    
    EaseMessageCell *cell = [EaseMessageCell appearance];
    CGFloat bubbleMaxWidth = cell.bubbleMaxWidth;
    if ([UIDevice currentDevice].systemVersion.floatValue == 7.0) {
        bubbleMaxWidth = 200;
    }
    
    if (model.isSender) {
        bubbleMaxWidth -= (15 + 20 + 60 + 10);

    }else{
        bubbleMaxWidth -= (20 + 12 + 60 + 10);
    }
    
    
    CGFloat height = 15 + 20;
    
    NSString *titleStr = [model.message.ext objectForKey:@"extTitle"];
    NSString *desStr = [model.message.ext objectForKey:@"extDes"];

    
    NSAttributedString *text = [EaseMiniGameMessageCell getStrWithFirStr:[NSString stringWithFormat:@"%@\n",titleStr] secStr:desStr];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(bubbleMaxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    height += (rect.size.height > 60 ? rect.size.height : 60) + 22 + 32 ;

    height += EaseMessageCellPadding;
    model.cellHeight = height;
    return height;
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    if (self.model.isSender) {
        UIImage *sendImageNor = [UIImage imageNamed:@"EaseUIResource.bundle/chat_send_mini_game"];
        UIImage *sendImage = [sendImageNor resizableImageWithCapInsets:UIEdgeInsetsMake(10, 6, 6, 10) resizingMode:UIImageResizingModeStretch];

        self.bubbleView.backgroundImageView.image = sendImage;
    }

}


@end
