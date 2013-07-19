//
//  ViewController.m
//  ScrollView Hates Slider
//
//  Created by Kyle Howells on 19/07/2013.
//  Copyright (c) 2013 Kyle Howells. All rights reserved.
//

#import "ViewController.h"




/* I'm just going to throw the custom subclass up here as I dislike having lots of files (+ laziness to make them)*/
@interface KHCustomScrollView : UIScrollView
@property (nonatomic, assign) BOOL ignoreSliders;
@end

@implementation KHCustomScrollView
@synthesize ignoreSliders = _ignoreSliders;

-(BOOL)touchesShouldCancelInContentView:(UIView *)view{
    if (self.ignoreSliders) {
		if ([view isKindOfClass:[UISlider class]] && self.tag == 42) {
			return NO;
		}
		else {
			return YES;
		}
	}
	
	return [super touchesShouldCancelInContentView:view];
}
@end





/* And back to the actual class for this file, sorry for that...*/

@interface ViewController ()
-(void)autoContentSizeScrollView:(UIScrollView*)scrollView;
-(void)monitorSlider:(UISlider*)slider;
-(void)willSlide:(id)sender;
-(void)didSlide:(id)sender;
@end


@implementation ViewController
- (void)dealloc {
	[_scrollViewNormal release];
	[_scrollViewDelay release];
	[_scrollViewCustom release];
	[_scrollViewComplete release];
	[_sliderComplete release];
	[super dealloc];
}


-(void)viewDidLoad{
    [super viewDidLoad];
	
	// Basic setup
	[self autoContentSizeScrollView:self.scrollViewNormal];
	[self autoContentSizeScrollView:self.scrollViewDelay];
	[self autoContentSizeScrollView:self.scrollViewCustom];
	[self autoContentSizeScrollView:self.scrollViewComplete];
	
	
	
	
	
	
	/* Nothing todo for the normal scrollview, except look at it's problems */
	
	
	
	
	/* ScrollView delay only needs this: */
	self.scrollViewDelay.delaysContentTouches = NO;
	
	
	
	
	
	/* With the custom scrollView we filter out sliders */
	
	((KHCustomScrollView*)self.scrollViewCustom).ignoreSliders = YES;
	// You can toggle these 2 below if you want to play around a bit
	self.scrollViewCustom.delaysContentTouches = NO;
	self.scrollViewCustom.canCancelContentTouches = YES;
	
	self.scrollViewCustom.tag = 42; // Set it to pass the check we added for the one below us.
	
	
	
	
	/* And finially turn EVERYTHING on! */
	((KHCustomScrollView*)self.scrollViewComplete).ignoreSliders = YES;
	self.scrollViewComplete.canCancelContentTouches = YES;
	self.scrollViewComplete.delaysContentTouches = NO;
	// Monitor them!
	[self monitorSlider:self.sliderComplete];
	[self monitorSlider:self.sliderComplete1];
}


#pragma mark - Monitor Sliders
-(void)monitorSlider:(UISlider*)slider{
	[slider addTarget:self action:@selector(willSlide:) forControlEvents:UIControlEventTouchDown];
	[slider addTarget:self action:@selector(didSlide:) forControlEvents:UIControlEventTouchUpInside];
	[slider addTarget:self action:@selector(didSlide:) forControlEvents:UIControlEventTouchUpOutside];
	[slider addTarget:self action:@selector(didSlide:) forControlEvents:UIControlEventTouchCancel];
}
-(void)willSlide:(id)sender{
	self.scrollViewComplete.tag = 42;
}
-(void)didSlide:(id)sender{
	self.scrollViewComplete.tag = 40;
}


#pragma mark - Helper method
-(void)autoContentSizeScrollView:(UIScrollView*)scrollView{
	CGSize size = CGSizeZero;
	
	for (UIView *view in scrollView.subviews) {
		CGFloat width = view.frame.size.width + view.frame.origin.x;
		if (width > size.width) {
			size.width = width;
		}
	}
	
	scrollView.contentSize = size;
}

@end
