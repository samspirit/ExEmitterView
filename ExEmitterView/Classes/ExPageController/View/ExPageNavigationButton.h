//
//  ExPageNavigationButton.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import <UIKit/UIKit.h>
#import "ExPageParam.h"
NS_ASSUME_NONNULL_BEGIN

@class ExPageParam;
@interface ExPageNavigationButton : UIButton

@property(nonatomic,strong)ExPageParam *param;
//最大size
@property(nonatomic,assign)CGSize maxSize;
//处于动画状态
@property(nonatomic,assign)BOOL animal;
//有红点提示
@property(nonatomic,assign)BOOL hasBadge;
//富文本
@property(nonatomic,assign)BOOL attributed;
//RGB值
@property (nonatomic, assign) CGFloat selectedColorR;
@property (nonatomic, assign) CGFloat selectedColorG;
@property (nonatomic, assign) CGFloat selectedColorB;
@property (nonatomic, assign) CGFloat unSelectedColorR;
@property (nonatomic, assign) CGFloat unSelectedColorG;
@property (nonatomic, assign) CGFloat unSelectedColorB;

//设置图文位置
- (void)TagSetImagePosition:(PageBtnPosition)postion spacing:(CGFloat)spacing;
//设置单边阴影
- (void)viewShadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(PageShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth;


@end

@interface ExPageNavigationButton (HMBadge)

@property (nonatomic, strong) UILabel *badge;
/**
 *  显示小红点
 *  @magin 小红点距离控件上方距离
 */
- (void)showBadgeWithTopMagin:(CGFloat)magin;

/**
 *  隐藏小红点
 */
- (void)hidenBadge;
@end

@interface UIColor (GradientColor)
+ (instancetype)bm_colorGradientChangeWithSize:(CGSize)size
                direction:(PageGradientChangeDirection)direction
                startColor:(UIColor*)startcolor
                endColor:(UIColor*)endColor;
@end

NS_ASSUME_NONNULL_END
