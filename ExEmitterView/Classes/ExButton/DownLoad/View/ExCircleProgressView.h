//
//  ExCircleProgressView.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface ExCircleProgressView : UIView
/// 下载进度 (0.f - 1.0f)
@property (nonatomic, assign) IBInspectable CGFloat progress;
/// 下载进度的线宽度 (0.f +)
@property (nonatomic, assign) IBInspectable CGFloat filledLineWidth;
/// 圆的线宽度 (0.f +)
@property (nonatomic, assign) IBInspectable CGFloat emptyLineWidth;
/// 内径圆的半径 (0.f +)
@property (nonatomic, assign) IBInspectable CGFloat radius;
@property (nonatomic, assign) IBInspectable BOOL filledLineStyleOuter;
@end

NS_ASSUME_NONNULL_END
