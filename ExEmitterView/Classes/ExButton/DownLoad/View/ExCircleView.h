//
//  ExCircleView.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface ExCircleView : UIView

@property (nonatomic, assign) IBInspectable CGFloat startAngleRadians;
@property (nonatomic, assign) IBInspectable CGFloat endAngleRadians;
@property (nonatomic, assign) IBInspectable CGFloat lineWidth;


@end

NS_ASSUME_NONNULL_END
