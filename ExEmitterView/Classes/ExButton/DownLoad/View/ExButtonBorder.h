//
//  ExButtonBorder.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExButtonBorder : UIButton

@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic) CGFloat lineWidth;

- (void)configureDefaultAppearance;

- (void)cleanDefaultAppearance;
@end

NS_ASSUME_NONNULL_END
