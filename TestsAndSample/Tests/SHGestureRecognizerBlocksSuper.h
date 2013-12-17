//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Seivan Heidari on 7/27/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "KIF.h"
#import "SHTestCaseAdditions.h"
#import "SHGestureRecognizerBlocks.h"




@interface SHGestureRecognizerBlocksSuper : KIFTestCase
@property(nonatomic,strong) UIViewController        * vc;
@property(nonatomic,strong) UIButton                * button;
@property(nonatomic,strong) NSString                * titleButton;
@property(nonatomic,strong) UIGestureRecognizer     * gesture;
@property(nonatomic,copy) SHGestureRecognizerBlock block;
@end

