//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Seivan Heidari on 7/27/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//


#import "SHGestureRecognizerBlocksSuper.h"

@interface SHGestureRecognizerBlocksCallbacks : SHGestureRecognizerBlocksSuper
@property(nonatomic,assign) NSInteger isAsserted;
@end




@implementation SHGestureRecognizerBlocksCallbacks

#pragma mark - Init
-(void)testSH_gestureRecognizerWithBlock; {
  __block BOOL didAssert = NO;
  
  self.gesture = [UIGestureRecognizer SH_gestureRecognizerWithBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    didAssert = YES;
    XCTAssertEqualObjects(sender, self.gesture);
    XCTAssertEqual(state, UIGestureRecognizerStatePossible);
    XCTAssertEqual(location, CGPointZero);
    
  }];
  
  SHGestureRecognizerBlock block = self.gesture.SH_blocks.allObjects.firstObject;
  block(self.gesture, UIGestureRecognizerStatePossible, CGPointZero);
  XCTAssertTrue(didAssert);
}

#pragma mark - Add block
-(void)testSH_addBlock; {
  __block BOOL didAssertFirst  = NO;
  __block BOOL didAssertSecond = NO;
  self.gesture = [UIGestureRecognizer SH_gestureRecognizerWithBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    didAssertFirst = YES;
    XCTAssertEqualObjects(sender, self.gesture);
    XCTAssertEqual(state, UIGestureRecognizerStatePossible);
    XCTAssertEqual(location, CGPointZero);
    
  }];
  
  [self.gesture SH_addBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    didAssertSecond = YES;
    XCTAssertEqualObjects(sender, self.gesture);
    XCTAssertEqual(state, UIGestureRecognizerStatePossible);
    XCTAssertEqual(location, CGPointZero);

  }];
  
  NSArray * blocks = self.gesture.SH_blocks.allObjects;
  SHGestureRecognizerBlock block = blocks.firstObject;
  block(self.gesture, UIGestureRecognizerStatePossible, CGPointZero);
  block = blocks.lastObject;
  block(self.gesture, UIGestureRecognizerStatePossible, CGPointZero);
  
  XCTAssertTrue(didAssertFirst);
  XCTAssertTrue(didAssertSecond);
}

@end
