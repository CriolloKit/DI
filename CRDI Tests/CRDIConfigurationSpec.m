//
//  CRDIConfigurationSpec.m
//  CRDI
//
//  Created by TheSooth on 9/17/13.
//  Copyright (c) 2013 CriolloKit. All rights reserved.
//

#import <Kiwi.h>
#import "CRDIConfiguration.h"

SPEC_BEGIN(CRDIConfigurationSpec)

describe(@"CRDIConfiguration Specs", ^{
    it(@"Should raise due to init with nil object", ^{
        [[theBlock(^{
            [[CRDIConfiguration alloc] initWithContainer:nil];
        }) should] raise];
    });
    
    it(@"Should raise due to init with object that not kind of CRDIContainer class", ^{
        [[theBlock(^{
            [[CRDIConfiguration alloc] initWithContainer:@""];
        }) should] raise];
    });
    
    it(@"Should raise due to init with nil parent module", ^{
        [[theBlock(^{
            [[CRDIConfiguration alloc] initWithParentConfiguratuion:nil container:nil];
        }) should] raise];
    });
});

SPEC_END