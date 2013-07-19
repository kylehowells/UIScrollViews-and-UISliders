//
//  ViewController.h
//  ScrollView Hates Slider
//
//  Created by Kyle Howells on 19/07/2013.
//  Copyright (c) 2013 Kyle Howells. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIScrollView *scrollViewNormal;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollViewDelay;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollViewCustom;

@property (retain, nonatomic) IBOutlet UIScrollView *scrollViewComplete;
@property (retain, nonatomic) IBOutlet UISlider *sliderComplete;
@property (retain, nonatomic) IBOutlet UISlider *sliderComplete1;
@end
