//
//  UIView+Shadow.m
//  SectionCorner
//
//  Created by 李永杰 on 2019/4/26.
//  Copyright © 2019 李永杰. All rights reserved.
//

#import "UIView+Shadow.h"

@implementation UIView (Shadow)
-(void)shadow:(UIView *)view cornerRadius:(CGFloat)radius withShadow:(BOOL)shadow withOpacity:(CGFloat)opacity {
    
    
    if (shadow) {
        view.layer.shadowColor = [UIColor redColor].CGColor;
        view.layer.shadowOpacity = opacity;
        view.layer.shadowOffset = CGSizeMake(0, 2);
        view.layer.shadowRadius = 4;
        view.layer.shouldRasterize = NO;
        view.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:[view bounds] cornerRadius:radius] CGPath];
    }
    view.layer.masksToBounds = !shadow;
    
    //    view.clipsToBounds = NO;
    //    view.layer.masksToBounds = NO;
    //    view.layer.cornerRadius = 16;
    //    view.layer.shadowColor = [UIColor redColor].CGColor;
    //    view.layer.shadowOffset = CGSizeMake(0,0);
    //    view.layer.shadowOpacity = 1;
    //    view.layer.shadowRadius = 30;
}
@end
