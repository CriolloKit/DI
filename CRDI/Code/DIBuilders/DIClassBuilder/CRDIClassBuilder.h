//
//  CRDIClassBuilder.h
//  CRDI
//
//  Created by TheSooth on 9/16/13.
//  Copyright (c) 2013 CriolloKit. All rights reserved.
//

#import "CRDIDependencyBuilder.h"

@interface CRDIClassBuilder : NSObject <CRDIDependencyBuilder>

- (id)initWithClass:(Class)aClass;

@end
