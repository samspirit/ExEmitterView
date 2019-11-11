//
//  ExStopDownloadButton.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import "ExCircleProgressView.h"
NS_ASSUME_NONNULL_BEGIN

@class ExCircleProgressView;

IB_DESIGNABLE
@interface ExStopDownloadButton : ExCircleProgressView
/// 停止按钮的方块宽度
@property (nonatomic, assign) IBInspectable CGFloat stopButtonWidth;
@property (nonatomic, weak, readonly) UIButton *stopButton;
@end

NS_ASSUME_NONNULL_END
