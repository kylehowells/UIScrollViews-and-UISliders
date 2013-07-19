//
//  AppDelegate.m
//  ScrollView Hates Slider
//
//  Created by Kyle Howells on 19/07/2013.
//  Copyright (c) 2013 Kyle Howells. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

-(void)dealloc{
	[_window release];
	[_viewController release];
    [super dealloc];
}


-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
	self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
