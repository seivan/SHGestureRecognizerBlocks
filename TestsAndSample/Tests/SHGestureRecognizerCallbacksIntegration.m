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
    XCTAssertEqualObjects(sender, self.gesture);
    XCTAssertEqual(state, UIGestureRecognizerStateEnded);
    XCTAssertEqual(location, self.button.frame.origin);
    
  }];
  [self.button addGestureRecognizer:self.gesture];
  [tester tapViewWithAccessibilityLabel:self.titleButton];
  XCTAssertTrue(didAssert);
}

#pragma mark - Add block
-(void)testSH_addBlock; {
  __block BOOL didAssertFirst  = NO;
  __block BOOL didAssertSecond = NO;
  self.gesture = [UITapGestureRecognizer SH_gestureRecognizerWithBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    didAssertFirst = YES;
    XCTAssertEqualObjects(sender, self.gesture);
    XCTAssertEqual(state, UIGestureRecognizerStateEnded);
    XCTAssertEqual(location, self.button.frame.origin);
    
  }];
  
  [self.gesture SH_addBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    didAssertSecond = YES;
    XCTAssertEqualObjects(sender, self.gesture);
    XCTAssertEqual(state, UIGestureRecognizerStateEnded);
    XCTAssertEqual(location, self.button.frame.origin);
    
  }];
  
  [self.button addGestureRecognizer:self.gesture];
  [tester tapViewWithAccessibilityLabel:self.titleButton];
  
  XCTAssertTrue(didAssertFirst);
  XCTAssertTrue(didAssertSecond);
}

@end
