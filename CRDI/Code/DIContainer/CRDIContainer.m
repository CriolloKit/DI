//
//  CRDIContainer.m
//  CRDI
//
//  Created by TheSooth on 9/16/13.
//  Copyright (c) 2013 CriolloKit. All rights reserved.
//

#import "CRDIContainer.h"

static CRDIContainer *defaultContainer = nil;

@interface CRDIContainer ()

@property (nonatomic, strong) NSMutableDictionary *configurationDictionary;

@end

@implementation CRDIContainer

+ (CRDIContainer *)defaultContainer
{
    
    return defaultContainer;
}

+ (void)setDefaultContainer:(CRDIContainer *)aContainer
{
    defaultContainer = aContainer;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        self.configurationDictionary = [NSMutableDictionary new];
    }
    
    return self;
}

@end
