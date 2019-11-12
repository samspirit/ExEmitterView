//
//  ExPageParam.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import <Foundation/Foundation.h>
#import "ExPageConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExPageParam : NSObject

/* =========================================required==============================================*/
//标题数组 必传
ExPagePropStatementAndPropSetFuncStatement(strong, ExPageParam, NSArray*,              wTitleArr)
//VC数组 必传
ExPagePropStatementAndPropSetFuncStatement(strong, ExPageParam, NSArray*,              wControllers)
/* =========================================required==============================================*/

/* =========================================special==============================================*/
//特殊属性 菜单滑动到顶部悬浮 default NO
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, BOOL,                  wTopSuspension)
//导航栏透明度变化 default NO
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, BOOL,                  wNaviAlpha)
//滑动切换 default YES
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, BOOL,                  wScrollCanTransfer)
//头部视图frame从导航栏下方开始 default YES
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, BOOL,                  wFromNavi)
//菜单最右边固定内容是否开启左边阴影 defaulf YES
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, BOOL,                  wMenuFixShadow)
//选中变大 default yes
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, BOOL,                  wMenuAnimalTitleBig)
//开启渐变色 default yes
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, BOOL,                  wMenuAnimalTitleGradient)
/* =========================================special==============================================*/

/* =========================================Menu==================================================*/
//默认选中 default 0
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, NSInteger,             wMenuDefaultIndex)
//菜单最右边固定内容 default nil
ExPagePropStatementAndPropSetFuncStatement(strong, ExPageParam, id,                    wMenuFixRightData)
//菜单最右边固定内容宽度 defaulf 45
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, CGFloat,               wMenuFixWidth)
//菜单标题动画效果 default  PageTitleMenuMove
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, PageTitleMenu,         wMenuAnimal)
//头部视图 default nil
ExPagePropStatementAndPropSetFuncStatement(copy,   ExPageParam, PageHeadViewBlock,     wMenuHeadView)
//菜单宽度 default 屏幕宽度
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, CGFloat,               wMenuWidth)
//菜单背景颜色 default ffffff
ExPagePropStatementAndPropSetFuncStatement(strong, ExPageParam, UIColor*,              wMenuBgColor)
//菜单按钮的左右间距 default 20
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, CGFloat,               wMenuCellMargin)
//菜单按钮的上下间距 default 20 (可根据此属性改变导航栏的高度)
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, CGFloat,               wMenuCellPadding)
//菜单的位置 default PageMenuPositionLeft
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, PageMenuPosition,      wMenuPosition)
//菜单标题左右间距 default 0
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, CGFloat,               wMenuTitleOffset)
//菜单标题字体 default 15.0f
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, CGFloat,               wMenuTitleFont)
//菜单标题固定宽度 default 文本内容宽度+wMenuCellMargin
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, CGFloat,               wMenuTitleWidth)
//菜单标题字体粗体 default 0
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, CGFloat,               wMenuTitleWeight)
//菜单字体颜色 default 333333
ExPagePropStatementAndPropSetFuncStatement(strong, ExPageParam, UIColor*,              wMenuTitleColor)
//菜单字体选中颜色 default E5193E
ExPagePropStatementAndPropSetFuncStatement(strong, ExPageParam, UIColor*,              wMenuTitleSelectColor)
//菜单图文位置 default PageBtnPositionTop
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, PageBtnPosition,       wMenuImagePosition)
//菜单图文位置间距 default 5
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, CGFloat,               wMenuImageMargin)
//指示器颜色 default E5193E
ExPagePropStatementAndPropSetFuncStatement(strong, ExPageParam, UIColor*,              wMenuIndicatorColor)
//指示器宽度 default 标题宽度+10
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, CGFloat,               wMenuIndicatorWidth)
//指示器图片 default nil
ExPagePropStatementAndPropSetFuncStatement(strong, ExPageParam, NSString*,             wMenuIndicatorImage)
//指示器高度 default k1px
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, CGFloat,               wMenuIndicatorHeight)
//指示器圆角 default 0
ExPagePropStatementAndPropSetFuncStatement(assign, ExPageParam, CGFloat,               wMenuIndicatorRadio)
/* =========================================Menu===============================================*/

/* =========================================Events==================================================*/
ExPageParam * PageParam(void);
//右边固定标题点击
ExPagePropStatementAndPropSetFuncStatement(copy,   ExPageParam, PageClickBlock,        wEventFixedClick)
//标题点击
ExPagePropStatementAndPropSetFuncStatement(copy,   ExPageParam, PageClickBlock,        wEventClick)
//控制器开始切换
ExPagePropStatementAndPropSetFuncStatement(copy,   ExPageParam, PageVCChangeBlock,     wEventBeganTransferController)
//控制器结束切换
ExPagePropStatementAndPropSetFuncStatement(copy,   ExPageParam, PageVCChangeBlock,     wEventEndTransferController)
//子控制器滚动(做滚动时候自己的操作)  =>开启悬浮有效
ExPagePropStatementAndPropSetFuncStatement(copy,   ExPageParam, PageChildVCScroll,     wEventChildVCDidSroll)
/* =========================================Events==================================================*/



@end

NS_ASSUME_NONNULL_END
