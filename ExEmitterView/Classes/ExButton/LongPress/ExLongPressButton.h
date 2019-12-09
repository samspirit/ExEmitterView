//
//  ExLongPressButton.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

///点击回调
typedef void(^TapCompleteHandler)(void);
///开始长按回调
typedef void(^StartLongPressCompleteHandler)(void);
///结束长按回调
typedef void(^EndLongPressCompleteHandler)(float longPressTime);
///取消长按回调
typedef void(^CancelLongPressCompleteHandler)(void);

@interface ExLongPressButton : UIControl

/// 按钮中心颜色，默认红色
@property (strong, nonatomic) UIColor *topColor;
/// 进度条颜色
@property (strong, nonatomic) UIColor *progressColor;
/// 最长的长按时间，默认为5s
@property (assign, nonatomic) float maxPressTime;
/// 是否需要遮罩 默认 YES
@property (assign, nonatomic) BOOL isMaskView;
/// 是否需要振动 默认 YES
@property (assign, nonatomic) BOOL isVibration;
/// 点击回调
@property (copy, nonatomic) TapCompleteHandler tapCompleteHandler;
/// 开始长按
@property (copy, nonatomic) StartLongPressCompleteHandler startLongPressCompleteHandler;
/// 结束长按
@property (copy, nonatomic) EndLongPressCompleteHandler endLongPressCompleteHandler;
/// 取消长按
@property (copy, nonatomic) CancelLongPressCompleteHandler cancelLongPressCompleteHandler;

@end

NS_ASSUME_NONNULL_END
