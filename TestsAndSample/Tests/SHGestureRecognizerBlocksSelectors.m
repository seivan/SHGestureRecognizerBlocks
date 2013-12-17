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
  XCTAssertNil(self.gesture.delegate);
}

#pragma mark - Init
-(void)testSH_gestureRecognizerWithoutBlock; {
  XCTAssertNotNil(self.gesture);
}

-(void)testSH_gestureRecognizerWithBlock; {
  self.gesture = [UIGestureRecognizer SH_gestureRecognizerWithBlock:self.block];
  XCTAssertNotNil(self.gesture);
}

#pragma mark - Add block
-(void)testSH_addBlock; {
  [self.gesture SH_addBlock:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    
  }];
  
  XCTAssertEqual(self.gesture.SH_blocks.count, 1U);
}

#pragma mark - Remove block
-(void)testSH_removeBlock; {
  [self.gesture SH_addBlock:self.block];
  [self.gesture SH_addBlock:self.block];
  [self.gesture SH_removeBlock:self.block];
  XCTAssertTrue(self.gesture.SH_blocks.count == 0);
}

-(void)testSH_removeAllBlocks; {
  SHGestureRecognizerBlock block = ^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    
  };
  [self.gesture SH_addBlock:block];
  [self.gesture SH_addBlock:self.block];
  
  [self.gesture SH_removeBlock:self.block];
  [self.gesture SH_removeBlock:block];
  XCTAssertTrue(self.gesture.SH_blocks.count == 0);
  
}

#pragma mark - Properties

#pragma mark - Getters
-(void)testSH_blocks; {
  XCTAssertNotNil(self.gesture.SH_blocks);
  XCTAssertTrue(self.gesture.SH_blocks.count == 0);
  [self.gesture SH_addBlock:self.block];
  [self.gesture SH_addBlock:self.block];
  [self.gesture SH_addBlock:self.block];
  
  XCTAssertEqual(self.gesture.SH_blocks.count, 1U);
  
}

@end
