//
//  CRDIContainer.m
//  CRDI
//
//  Created by TheSooth on 9/16/13.
//  Copyright (c) 2013 CriolloKit. All rights reserved.
//

#import "CRDIContainer.h"

#import "CRDIClassBuilder.h"
#import "CRDIBlockBuilder.h"
#import "CRDISingletoneBuilder.h"

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

- (void)bindClass:(Class)aClass toProtocol:(Protocol *)aProtocol
{
    NSParameterAssert(aClass);
    NSParameterAssert(aProtocol);
    
    CRDIClassBuilder *classBuilder = [self classBuilderFromClass:aClass];
    
    [self addBuilder:classBuilder forProtocol:aProtocol];
}

- (void)bindBlock:(CRDIContainerBindBlock)aBlock toProtocol:(Protocol *)aProtocol
{
    NSParameterAssert(aBlock);
    NSParameterAssert(aProtocol);
    
    CRDIBlockBuilder *blockBuilder = [self blockBuilderFromBlock:aBlock];
    
    [self addBuilder:blockBuilder forProtocol:aProtocol];
}

- (void)bindEagerSingletoneClass:(Class)aClass toProtocol:(Protocol *)aProtocol
{
    NSParameterAssert(aClass);
    NSParameterAssert(aProtocol);
    
    CRDISingletoneBuilder *eaggerSingletoneWithClassBuilder = [self eagerSingletoneBuilderForClass:aClass];
    
    [self addBuilder:eaggerSingletoneWithClassBuilder forProtocol:aProtocol];
}

- (void)bindEagerSingletoneBlock:(CRDIContainerBindBlock)aBlock toProtocol:(Protocol *)aProtocol
{
    NSParameterAssert(aBlock);
    NSParameterAssert(aProtocol);
    
    CRDISingletoneBuilder *eagerSingletoneWithBlockbuilder = [self eagerSingletoneBuilderForBlock:aBlock];
    
    [self addBuilder:eagerSingletoneWithBlockbuilder forProtocol:aProtocol];
}

- (void)addBuilder:(id <CRDIDependencyBuilder>)aBuilder forProtocol:(Protocol *)aProtocol
{
    NSParameterAssert(aBuilder);
    NSParameterAssert(aProtocol);
    
    if (![aBuilder conformsToProtocol:@protocol(CRDIDependencyBuilder)]) {
        @throw [CRDIException exceptionWithReason:[NSString stringWithFormat:@"%@ not impelemnts CRDIDependencyBuilder interface",
                                                   NSStringFromClass([aBuilder class])]];
    }
    
    NSString *protocolKey = [self stringFromPorotocol:aProtocol];
    
    [self checkKeyIsAlreadyExists:protocolKey];
    
    [self.configurationDictionary setObject:aBuilder forKey:protocolKey];
}

- (id <CRDIDependencyBuilder>)builderForProtocol:(Protocol *)aProtocol
{
    NSParameterAssert(aProtocol);
    
    NSString *protocolKey = [self stringFromPorotocol:aProtocol];
    
    [self checkIfKeyNotExists:protocolKey];
    
    return self.configurationDictionary[protocolKey];
}

- (CRDIClassBuilder *)classBuilderFromClass:(Class)aClass
{
    return [[CRDIClassBuilder alloc] initWithClass:aClass];
}

- (CRDIBlockBuilder *)blockBuilderFromBlock:(CRDIContainerBindBlock)aBlock
{
    return [[CRDIBlockBuilder alloc] initWithBlock:aBlock];
}

- (CRDISingletoneBuilder *)eagerSingletoneBuilderForClass:(Class)aClass
{
    CRDIClassBuilder *classBuilder = [self classBuilderFromClass:aClass];
    
    return [[CRDISingletoneBuilder alloc] initWithBuilder:classBuilder];
}

- (CRDISingletoneBuilder *)eagerSingletoneBuilderForBlock:(CRDIContainerBindBlock)aBlock
{
    CRDIBlockBuilder *blockBuilder = [self blockBuilderFromBlock:aBlock];
    
    return [[CRDISingletoneBuilder alloc] initWithBuilder:blockBuilder];
}

- (void)checkKeyIsAlreadyExists:(NSString *)aKey
{
    if (self.configurationDictionary[aKey]) {
        @throw [CRDIException exceptionWithReason:[NSString stringWithFormat:@"Container already contains protocol %@", aKey]];
    }
}

- (void)checkIfKeyNotExists:(NSString *)aKey
{
    if (!self.configurationDictionary[aKey]) {
        @throw [CRDIException exceptionWithReason:[NSString stringWithFormat:@"Builder for protocol %@ not binded", aKey]];
    }
}

- (NSString *)stringFromPorotocol:(Protocol *)aProtocol
{
    return NSStringFromProtocol(aProtocol);
}

@end
