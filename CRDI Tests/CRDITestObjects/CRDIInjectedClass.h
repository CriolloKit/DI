//
//  CRDIInjectedClass.h
//  CRDI
//
//  Created by TheSooth on 9/16/13.
//  Copyright (c) 2013 CriolloKit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRDISampleProtocol.h"

@interface CRDIInjectedClass : NSObject

@property (nonatomic, weak) id <CRDISampleProtocol> ioc_injected;

@end
