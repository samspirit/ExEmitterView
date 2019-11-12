//
//  ExPageParam.m
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#define ExPagePropSetFuncImplementation(className, propertyPointerType, propertyName) \
- (className * (^) (propertyPointerType propertyName))propertyName##Set{              \
return ^(propertyPointerType propertyName) {                                          \
_##propertyName = propertyName;                                                       \
return self;                                                                          \
};                                                                                    \
}

#import "ExPageParam.h"

@implementation ExPageParam

ExPageParam *PageParam(void) {
    return  [ExPageParam new];
}
ExPagePropSetFuncImplementation(ExPageParam, NSArray*,               wTitleArr)
ExPagePropSetFuncImplementation(ExPageParam, NSArray*,               wControllers)
ExPagePropSetFuncImplementation(ExPageParam, PageTitleMenu,          wMenuAnimal)
ExPagePropSetFuncImplementation(ExPageParam, BOOL,                   wMenuAnimalTitleBig)
ExPagePropSetFuncImplementation(ExPageParam, BOOL,                   wMenuAnimalTitleGradient)
ExPagePropSetFuncImplementation(ExPageParam, BOOL,                   wMenuFixShadow)
ExPagePropSetFuncImplementation(ExPageParam, CGFloat,                wMenuWidth)
ExPagePropSetFuncImplementation(ExPageParam, PageMenuPosition,       wMenuPosition)
ExPagePropSetFuncImplementation(ExPageParam, CGFloat,                wMenuTitleOffset)
ExPagePropSetFuncImplementation(ExPageParam, CGFloat,                wMenuTitleWidth)
ExPagePropSetFuncImplementation(ExPageParam, NSInteger,              wMenuDefaultIndex)
ExPagePropSetFuncImplementation(ExPageParam, UIColor*,               wMenuTitleColor)
ExPagePropSetFuncImplementation(ExPageParam, CGFloat,                wMenuCellMargin)
ExPagePropSetFuncImplementation(ExPageParam, CGFloat,                wMenuCellPadding)
ExPagePropSetFuncImplementation(ExPageParam, UIColor*,               wMenuTitleSelectColor)
ExPagePropSetFuncImplementation(ExPageParam, CGFloat,                wMenuTitleFont)
ExPagePropSetFuncImplementation(ExPageParam, UIColor*,               wMenuIndicatorColor)
ExPagePropSetFuncImplementation(ExPageParam, CGFloat,                wMenuIndicatorWidth)
ExPagePropSetFuncImplementation(ExPageParam, CGFloat,                wMenuIndicatorHeight)
ExPagePropSetFuncImplementation(ExPageParam, CGFloat,                wMenuIndicatorRadio)
ExPagePropSetFuncImplementation(ExPageParam, NSString*,              wMenuIndicatorImage)
ExPagePropSetFuncImplementation(ExPageParam, PageBtnPosition,        wMenuImagePosition)
ExPagePropSetFuncImplementation(ExPageParam, CGFloat,                wMenuImageMargin)
ExPagePropSetFuncImplementation(ExPageParam, id,                     wMenuFixRightData)
ExPagePropSetFuncImplementation(ExPageParam, UIColor*,               wMenuBgColor)
ExPagePropSetFuncImplementation(ExPageParam, CGFloat,                wMenuFixWidth)
ExPagePropSetFuncImplementation(ExPageParam, PageHeadViewBlock,      wMenuHeadView)
ExPagePropSetFuncImplementation(ExPageParam, CGFloat,                wMenuTitleWeight)
ExPagePropSetFuncImplementation(ExPageParam, BOOL,                   wTopSuspension)
ExPagePropSetFuncImplementation(ExPageParam, BOOL,                   wFromNavi)
ExPagePropSetFuncImplementation(ExPageParam, BOOL,                   wNaviAlpha)
ExPagePropSetFuncImplementation(ExPageParam, BOOL,                   wScrollCanTransfer)
ExPagePropSetFuncImplementation(ExPageParam, PageClickBlock,         wEventFixedClick)
ExPagePropSetFuncImplementation(ExPageParam, PageClickBlock,         wEventClick)
ExPagePropSetFuncImplementation(ExPageParam, PageVCChangeBlock,      wEventBeganTransferController)
ExPagePropSetFuncImplementation(ExPageParam, PageVCChangeBlock,      wEventEndTransferController)
ExPagePropSetFuncImplementation(ExPageParam, PageChildVCScroll,      wEventChildVCDidSroll)


- (instancetype)init{
    if (self = [super init]) {
        _wMenuAnimal = PageTitleMenuNone;
        _wMenuTitleColor = PageColor(0x333333);
        _wMenuTitleSelectColor = PageColor(0xE5193E);
        _wMenuIndicatorColor = PageColor(0xE5193E);
        _wMenuBgColor = PageColor(0xffffff);
        _wMenuIndicatorHeight = 3.0f;
        _wMenuWidth = PageVCWidth;
        _wMenuAnimalTitleBig = YES;
        _wMenuAnimalTitleGradient = YES;
        _wMenuTitleFont = 17.0f;
        _wMenuImagePosition = PageBtnPositionTop;
        _wMenuImageMargin = 5.0f;
        _wMenuCellMargin = 30.0f;
        _wMenuCellPadding = 30.0f;
        _wMenuFixWidth = 45.0f;
        _wMenuFixShadow = YES;
        _wFromNavi = YES;
        _wScrollCanTransfer = YES;
    }
    return self;
}
@end
