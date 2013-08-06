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
    STAssertEqualObjects(sender, self.gesture, nil);
    STAssertEquals(state, UIGestureRecognizerStatePossible, nil);
    STAssertEquals(location, CGPointZero, nil);
    
  }];
  
  SHGestureRecognizerBlock block = self.gesture.SH_blocks.SH_toArray.SH_firstObject;
  block(self.gesture, UIGestureRecognizerStatePossible, CGPointZero);
  STAssertTrue(didAssert, nil);
}

#pragma mark - Add block
-(void)testSH_addBlock; {
  __block BOOL didAssertFirst  = NO;
  __block BOOL didAssertSecond = NO;
  self.gesture = [UIGestureRecognizer SH_gestureRecognizerWithBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    didAssertFirst = YES;
    STAssertEqualObjects(sender, self.gesture, nil);
    STAssertEquals(state, UIGestureRecognizerStatePossible, nil);
    STAssertEquals(location, CGPointZero, nil);
    
  }];
  
  [self.gesture SH_addBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    didAssertSecond = YES;
    STAssertEqualObjects(sender, self.gesture, nil);
    STAssertEquals(state, UIGestureRecognizerStatePossible, nil);
    STAssertEquals(location, CGPointZero, nil);

  }];
  
  NSArray * blocks = self.gesture.SH_blocks.SH_toArray;
  SHGestureRecognizerBlock block = blocks.SH_firstObject;
  block(self.gesture, UIGestureRecognizerStatePossible, CGPointZero);
  block = blocks.SH_lastObject;
  block(self.gesture, UIGestureRecognizerStatePossible, CGPointZero);
  
  STAssertTrue(didAssertFirst, nil);
  STAssertTrue(didAssertSecond, nil);
}

@end
