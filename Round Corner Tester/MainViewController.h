//
//  MainViewController.h
//  RoundedCornersTester
//
//  Created by DX044 on 11-04-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


enum CornerType {
  CornerTypeQuartz = 0,
  CornerTypeImage = 1,
  CornerTypeSquare = 2
  };

@interface MainViewController : UIViewController {
  UIScrollView *scrollView_;
  UIButton *addMoreButton_;
  int numberOfSubviews_;
  enum CornerType type_;
}


- (UIView*)makeQuartzRoundedCornerView:(CGRect)aFrame;
- (UIView*)makeImageBasedRoundedCornerView:(CGRect)aFrame;
- (UIView*)makeSquareCornerView:(CGRect)aFrame;
- (UILabel*)createNumberLabel:(CGRect)aFrame;
@end
