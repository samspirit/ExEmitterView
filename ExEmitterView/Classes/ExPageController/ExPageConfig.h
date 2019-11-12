//
//  ExPageConfig.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#ifndef ExPageConfig_h
#define ExPageConfig_h

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "ExPageProtocol.h"
#import "NSObject+SafeKVO.h"

#define   PageVCWidth   [UIScreen mainScreen].bounds.size.width
#define   PageVCHeight  [UIScreen mainScreen].bounds.size.height


#define PageDarkColor(light,dark)    \
({\
    UIColor *wMenuIndicator = nil; \
    if (@available(iOS 13.0, *)) {  \
        wMenuIndicator = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) { \
        if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {  \
            return light;  \
        }else {   \
            return dark;  \
        }}];  \
    }else{  \
        wMenuIndicator = light;  \
    }   \
    (wMenuIndicator); \
})\

#define PageColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define PageK1px (1 / UIScreen.mainScreen.scale)

#define  PageVCIS_iPhoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size)  || CGSizeEqualToSize(CGSizeMake(414.f, 896.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(896.f, 414.f), [UIScreen mainScreen].bounds.size))
//状态栏高度
#define PageVCStatusBarHeight (PageVCIS_iPhoneX ? 44.f : 20.f)
//导航栏高度
#define PageVCNavBarHeight (44.f+PageVCStatusBarHeight)
//底部标签栏高度
#define PageVCTabBarHeight (PageVCIS_iPhoneX ? (49.f+34.f) : 49.f)

#define ExPagePropStatementAndPropSetFuncStatement(propertyModifier,className, propertyPointerType, propertyName)           \
@property(nonatomic,propertyModifier)propertyPointerType  propertyName;                                                 \
- (className * (^) (propertyPointerType propertyName)) propertyName##Set;

typedef enum :NSInteger {
    PageBtnPositionLeft     = 0,            //图片在左，文字在右，默认
    PageBtnPositionRight    = 1,            //图片在右，文字在左
    PageBtnPositionTop      = 2,            //图片在上，文字在下
    PageBtnPositionBottom   = 3,            //图片在下，文字在上
}PageBtnPosition;


typedef enum :NSInteger {
    PageTitleMenuNone     = 0,            //无样式
    PageTitleMenuLine     = 1,            //带下划线
    PageTitleMenuCircle   = 2,            //背景圆角框
    PageTitleMenuAiQY     = 3,            //爱奇艺效果(指示器跟随移动)
    PageTitleMenuTouTiao  = 4,            //今日头条效果(变大加颜色渐变)
    PageTitleMenuYouKu    = 5,            //优酷效果(变大字体加粗 指示器圆点 指示器跟随移动)
    PageTitleMenuPDD      = 6,            //拼多多效果(底部线条)
}PageTitleMenu;


typedef enum :NSInteger{
    PageMenuPositionLeft          = 0,            //上左
    PageMenuPositionRight         = 1,            //上右
    PageMenuPositionCenter        = 2,            //居中
    PageMenuPositionNavi          = 3,            //导航栏
    PageMenuPositionBottom        = 4,            //底部
}PageMenuPosition;

//设置阴影
typedef enum :NSInteger{
    PageShadowPathTop,
    PageShadowPathBottom,
    PageShadowPathLeft,
    PageShadowPathRight,
    PageShadowPathCommon,
    PageShadowPathAround
}PageShadowPathType;

//渐变色
typedef enum :NSInteger{
    PageGradientChangeDirectionLevel,                    //水平方向渐变
    PageGradientChangeDirectionVertical,                 //垂直方向渐变
    PageGradientChangeDirectionUpwardDiagonalLine,       //主对角线方向渐变
    PageGradientChangeDirectionDownDiagonalLine,         //副对角线方向渐变
}PageGradientChangeDirection;


/*
 * 点击
 */
typedef void (^PageClickBlock)(id anyID,NSInteger index);

/*
 * 控制器切换
 */
typedef void (^PageVCChangeBlock)(UIViewController* oldVC,UIViewController *newVC,NSInteger oldIndex,NSInteger newIndex);


/*
 * 子控制器滚动
 */
typedef void (^PageChildVCScroll)(UIViewController* pageVC,CGPoint oldPoint,CGPoint newPonit,UIScrollView *currentScrollView,CGFloat offset);

/*
 * 头视图
 */
typedef UIView* (^PageHeadViewBlock)(void);
#endif /* ExPageConfig_h */
