/*$Id: NSUserDefaults_SenAdditions.m,v 1.4 2001/10/02 16:07:02 phink Exp $*/

// Copyright (c) 1997-2001, Sen:te Ltd.  All rights reserved.
//
// Use of this source code is governed by the license in OpenSourceLicense.html
// found in this distribution and at http://www.sente.ch/software/ ,  where the
// original version of this source code can also be found.
// This notice may not be removed from this file.

#import "NSUserDefaults_SenAdditions.h"
#import "SenAssertion.h"

@implementation NSUserDefaults (SenAdditions)

+ (void) registerDefaultsFromBundle:(NSBundle *) aBundle
{
    static NSString *defaultsDictionaryKey = @"Defaults";
    senassert (aBundle != nil);
    {
        NSDictionary *defaultDictionary = [[aBundle infoDictionary] objectForKey:defaultsDictionaryKey];
        if (defaultDictionary != nil){
            [[self standardUserDefaults] registerDefaults:defaultDictionary];
        }
    }
}

@end
