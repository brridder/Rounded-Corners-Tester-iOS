//
//  MainViewController.m
//  RoundedCornersTester
//
//  Created by DX044 on 11-04-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>

// Set the subview's frame here
#define SUBVIEW_HEIGHT              100.0f
#define SUBVIEW_WIDTH               (self.view.frame.size.width - 20.0f)
#define SUBVIEW_VERTICAL_SPACING    10.0f
#define SUBVIEW_HORIZONTAL_SPACING  10.0f

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)dealloc {
  [super dealloc];
}


- (void)viewDidLoad {
  [super viewDidLoad];
  
  /**************************/
  /* Set Type here          */
  type_ = CornerTypeSquare;
  /**************************/
  numberOfSubviews_ = 0;
  
  scrollView_ = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
  [self.view addSubview:scrollView_];
  scrollView_.contentSize = CGSizeMake(self.view.frame.size.width, SUBVIEW_HEIGHT*numberOfSubviews_ + SUBVIEW_VERTICAL_SPACING*numberOfSubviews_);
  
  addMoreButton_ = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
  [addMoreButton_ addTarget:self action:@selector(addMoreButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  [addMoreButton_ setTitle:@"Add 5 more views" forState:UIControlStateNormal];
  addMoreButton_.frame = CGRectMake(SUBVIEW_HORIZONTAL_SPACING, SUBVIEW_VERTICAL_SPACING, SUBVIEW_WIDTH, SUBVIEW_HEIGHT);
  [scrollView_ addSubview:addMoreButton_];
  
  CGRect aFrame = CGRectMake(SUBVIEW_HORIZONTAL_SPACING, SUBVIEW_VERTICAL_SPACING + addMoreButton_.frame.size.height + addMoreButton_.frame.origin.y, SUBVIEW_WIDTH, SUBVIEW_HEIGHT);
  UIView *aView = nil;
  for (int i = 0; i < 10; i++) {
    if (type_ == CornerTypeQuartz) {
      aView = [[self makeQuartzRoundedCornerView:aFrame] retain];
    } else if (type_ == CornerTypeImage) {
      aView = [[self makeImageBasedRoundedCornerView:aFrame] retain];
    } else {
      aView = [[self makeSquareCornerView:aFrame] retain];
    }
    [scrollView_ addSubview:aView];
    [aView release];
    aFrame.origin.y = aFrame.origin.y + SUBVIEW_HEIGHT + SUBVIEW_VERTICAL_SPACING;
  }
  scrollView_.contentSize = CGSizeMake(self.view.frame.size.width, SUBVIEW_HEIGHT*numberOfSubviews_ + SUBVIEW_VERTICAL_SPACING*numberOfSubviews_);
}

- (UIView*)makeQuartzRoundedCornerView:(CGRect)aFrame {
  UIView *aView = [[UIView alloc] initWithFrame:aFrame];
  aView.backgroundColor = [UIColor lightGrayColor];
  [aView.layer setCornerRadius:5.0f];
  [aView.layer setMasksToBounds:YES];
  [aView.layer setBorderColor:[[UIColor blackColor] CGColor]];
  [aView.layer setBorderWidth:1.0f];
  [aView addSubview:[self createNumberLabel:CGRectMake(0, 0, aFrame.size.width, aFrame.size.height)]];
  numberOfSubviews_++;
  return [aView autorelease];
}

- (UIView*)makeImageBasedRoundedCornerView:(CGRect)aFrame {
  UIView *aView = [[UIView alloc] initWithFrame:aFrame]; 
  UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"RoundedImageBox.png"] stretchableImageWithLeftCapWidth:8 topCapHeight:8]];
  backgroundImage.frame = CGRectMake(0, 0, aFrame.size.width, aFrame.size.height);
  aView.backgroundColor = [UIColor greenColor];
  [aView addSubview:backgroundImage];
  [backgroundImage release];
  [aView addSubview:[self createNumberLabel:CGRectMake(0, 0, aFrame.size.width, aFrame.size.height)]];
  numberOfSubviews_++;
  return [aView autorelease];
  
}

- (UIView*)makeSquareCornerView:(CGRect)aFrame {
  UIView *aView = [[UIView alloc] initWithFrame:aFrame];
  aView.backgroundColor = [UIColor lightGrayColor];
  [aView.layer setBorderColor:[[UIColor grayColor] CGColor]];
  [aView.layer setBorderWidth:1.0f];
  [aView addSubview:[self createNumberLabel:CGRectMake(0, 0, aFrame.size.width, aFrame.size.height)]];
  numberOfSubviews_++;
  return [aView autorelease];  
}

- (void)addMoreButtonPressed:(id)sender {
  CGRect aFrame = CGRectMake(SUBVIEW_HORIZONTAL_SPACING, SUBVIEW_HEIGHT*(numberOfSubviews_+1) + SUBVIEW_VERTICAL_SPACING*(numberOfSubviews_+1) + SUBVIEW_VERTICAL_SPACING, SUBVIEW_WIDTH, SUBVIEW_HEIGHT);
  UIView *aView = nil;
  for (int i = 0; i < 5; i++) {
    if (type_ == CornerTypeQuartz) {
      aView = [[self makeQuartzRoundedCornerView:aFrame] retain];
    } else if (type_ == CornerTypeImage) {
      aView = [[self makeImageBasedRoundedCornerView:aFrame] retain];
    } else {
      aView = [[self makeSquareCornerView:aFrame] retain];
    }
    [scrollView_ addSubview:aView];
    [aView release];
    aFrame.origin.y = aFrame.origin.y + SUBVIEW_HEIGHT + SUBVIEW_VERTICAL_SPACING;
  }
  
  scrollView_.contentSize = CGSizeMake(self.view.frame.size.width, SUBVIEW_HEIGHT*(numberOfSubviews_+1) + SUBVIEW_VERTICAL_SPACING*(numberOfSubviews_+1));  
}

- (UILabel*)createNumberLabel:(CGRect)aFrame {
  UILabel *number = [[UILabel alloc] initWithFrame:aFrame];
  number.text = [NSString stringWithFormat:@"Number: %d",numberOfSubviews_];
  number.font = [UIFont boldSystemFontOfSize:16.0f];
  number.backgroundColor = [UIColor clearColor];
  number.textAlignment = UITextAlignmentCenter;
  return [number autorelease];
}

- (void)viewDidUnload {
  [super viewDidUnload];
  [scrollView_ release];
  [addMoreButton_ release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return NO;
}

@end
