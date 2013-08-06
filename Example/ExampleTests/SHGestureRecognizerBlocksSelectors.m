//
//  SHActionSheetBlocksCallbacksScenarion.m
//  Example
//
//  Created by Seivan Heidari on 7/31/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//

#import "SHGestureRecognizerBlocksSuper.h"


@interface SHGestureRecognizerBlocksSelectors : SHGestureRecognizerBlocksSuper

@end

@implementation SHGestureRecognizerBlocksSelectors

-(void)testHasNoDelegate; {
  STAssertNil(self.gesture.delegate, nil);
}

#pragma mark - Init
-(void)testSH_gestureRecognizerWithoutBlock; {
  STAssertNotNil(self.gesture, nil);
}

-(void)testSH_gestureRecognizerWithBlock; {
  self.gesture = [UIGestureRecognizer SH_gestureRecognizerWithBlock:self.block];
  STAssertNotNil(self.gesture, nil);
}

#pragma mark - Add block
-(void)testSH_addBlock; {
  [self.gesture SH_addBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    
  }];
  
  STAssertEquals(self.gesture.SH_blocks.count, 1U, nil);
}

#pragma mark - Remove block
-(void)testSH_removeBlock; {
  [self.gesture SH_addBlock:self.block];
  [self.gesture SH_addBlock:self.block];
  [self.gesture SH_removeBlock:self.block];
  STAssertTrue(self.gesture.SH_blocks.SH_isEmpty, nil);
}

-(void)testSH_removeAllBlocks; {
  SHGestureRecognizerBlock block = ^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    
  };
  [self.gesture SH_addBlock:block];
  [self.gesture SH_addBlock:self.block];
  
  [self.gesture SH_removeBlock:self.block];
  [self.gesture SH_removeBlock:block];
  STAssertTrue(self.gesture.SH_blocks.SH_isEmpty, nil);
  
}

#pragma mark - Properties

#pragma mark - Getters
-(void)testSH_blocks; {
  STAssertNotNil(self.gesture.SH_blocks, nil);
  STAssertTrue(self.gesture.SH_blocks.SH_isEmpty, nil);
  [self.gesture SH_addBlock:self.block];
  [self.gesture SH_addBlock:self.block];
  [self.gesture SH_addBlock:self.block];
  
  STAssertEquals(self.gesture.SH_blocks.count, 1U, nil);
  
}

@end
