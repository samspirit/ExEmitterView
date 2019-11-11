//
//  ExWaitingView.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import <UIKit/UIKit.h>
#import "ExCircleView.h"
NS_ASSUME_NONNULL_BEGIN

@class ExCircleView;
IB_DESIGNABLE
@interface ExWaitingView : UIControl

@property (nonatomic, weak, readonly) ExCircleView *circleView;
/// 内径圆的半径
@property (nonatomic, assign) IBInspectable CGFloat radius;
/// 线的宽度
@property (nonatomic, assign) IBInspectable CGFloat lineWidth;
/// 内径圆的线宽度
@property (nonatomic, assign) IBInspectable CGFloat emptyLineRadians;
@property (nonatomic, assign) IBInspectable CGFloat spinTime;

- (void)startSpin;
- (void)stopSpin;
@end

NS_ASSUME_NONNULL_END
