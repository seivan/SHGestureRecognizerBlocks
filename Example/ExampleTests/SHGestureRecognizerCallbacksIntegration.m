//
//  SHActionSheetBlocksCallbacksScenarion.m
//  Example
//
//  Created by Seivan Heidari on 7/31/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//

#import "SHGestureRecognizerBlocksSuper.h"


@interface SHGestureRecognizerBlocksCallbacksIntegration : SHGestureRecognizerBlocksSuper

@end

@implementation SHGestureRecognizerBlocksCallbacksIntegration

#pragma mark - Init
-(void)testSH_gestureRecognizerWithBlock; {
  __block BOOL didAssert = NO;
  
  self.gesture = [UITapGestureRecognizer SH_gestureRecognizerWithBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    didAssert = YES;
    STAssertEqualObjects(sender, self.gesture, nil);
    STAssertEquals(state, UIGestureRecognizerStateEnded, nil);
    STAssertEquals(location, self.button.frame.origin, nil);
    
  }];
  [self.button addGestureRecognizer:self.gesture];
  [tester tapViewWithAccessibilityLabel:self.titleButton];
  STAssertTrue(didAssert, nil);
}

#pragma mark - Add block
-(void)testSH_addBlock; {
  __block BOOL didAssertFirst  = NO;
  __block BOOL didAssertSecond = NO;
  self.gesture = [UITapGestureRecognizer SH_gestureRecognizerWithBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    didAssertFirst = YES;
    STAssertEqualObjects(sender, self.gesture, nil);
    STAssertEquals(state, UIGestureRecognizerStateEnded, nil);
    STAssertEquals(location, self.button.frame.origin, nil);
    
  }];
  
  [self.gesture SH_addBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    didAssertSecond = YES;
    STAssertEqualObjects(sender, self.gesture, nil);
    STAssertEquals(state, UIGestureRecognizerStateEnded, nil);
    STAssertEquals(location, self.button.frame.origin, nil);
    
  }];
  
  [self.button addGestureRecognizer:self.gesture];
  [tester tapViewWithAccessibilityLabel:self.titleButton];
  
  STAssertTrue(didAssertFirst, nil);
  STAssertTrue(didAssertSecond, nil);
}

@end
