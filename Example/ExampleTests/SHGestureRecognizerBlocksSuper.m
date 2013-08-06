//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Seivan Heidari on 7/27/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//



#import "SHGestureRecognizerBlocksSuper.h"



@implementation SHGestureRecognizerBlocksSuper

-(void)setUp; {
  self.vc = UIViewController.new;
  [UIApplication sharedApplication].keyWindow.rootViewController = self.vc;
  [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
  self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  self.gesture = [UIGestureRecognizer SH_gestureRecognizerWithBlock:nil];
  self.button.frame = CGRectMake(50, 50, 100, 100);
  self.titleButton = @"Button Title";
  [self.button setTitle:self.titleButton forState:UIControlStateNormal];
  [self.vc.view addSubview:self.button];
  self.block = ^(UIGestureRecognizer * sender, UIGestureRecognizerState state, CGPoint location) {};
}

@end

