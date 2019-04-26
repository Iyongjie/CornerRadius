//
//  UIView+Shadow.h
//  SectionCorner
//
//  Created by 李永杰 on 2019/4/26.
//  Copyright © 2019 李永杰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Shadow)
-(void)shadow:(UIView *)view cornerRadius:(CGFloat)radius withShadow:(BOOL)shadow withOpacity:(CGFloat)opacity;
@end

NS_ASSUME_NONNULL_END
