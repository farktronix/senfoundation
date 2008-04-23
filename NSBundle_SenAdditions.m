/*$Id: NSBundle_SenAdditions.m,v 1.4 2001/03/29 07:39:09 stephane Exp $*/

// Copyright (c) 1997-2001, Sen:te Ltd.  All rights reserved.
//
// Use of this source code is governed by the license in OpenSourceLicense.html
// found in this distribution and at http://www.sente.ch/software/ ,  where the
// original version of this source code can also be found.
// This notice may not be removed from this file.

#import "NSBundle_SenAdditions.h"

#define BUILD_NUMBER_KEY  @"SenBuildNumber"
#define VERSION_KEY       @"SenVersion"

#ifdef WIN32
#define EXECUTABLE_EXTENSION @".exe"
#else
#define EXECUTABLE_EXTENSION @""
#endif

@interface NSBundle (SenAdditions_Private)
- (NSString *) _computeExecutablePath; // Undocumented feature from Foundation
@end


@implementation NSBundle (SenAdditions)
- (NSString *) executablePath
{
#if 0
    NSDictionary *dictionary = [self infoDictionary];
    if (dictionary != nil) {
        NSString *executableName = [dictionary objectForKey:@"NSExecutable"];
        if (executableName != nil) {
            NSString *path = [NSString stringWithFormat:@"%@/%@%@", [self bundlePath], executableName, EXECUTABLE_EXTENSION];
            return ([[NSFileManager defaultManager] fileExistsAtPath:path]) ? path : [NSString stringWithFormat:@"%@_debug%@", path, EXECUTABLE_EXTENSION];
        }
    }
    return nil;
#endif
    return [self _computeExecutablePath];
}


+ (void) touchAllFrameworks
{
    [[self allFrameworks] makeObjectsPerformSelector:@selector (principalClass)];
}


@end
