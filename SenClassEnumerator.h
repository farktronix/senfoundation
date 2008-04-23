/*$Id: SenClassEnumerator.h,v 1.5 2001/04/09 14:40:13 william Exp $*/

// Copyright (c) 1997-2001, Sen:te Ltd.  All rights reserved.
//
// Use of this source code is governed by the license in OpenSourceLicense.html
// found in this distribution and at http://www.sente.ch/software/ ,  where the
// original version of this source code can also be found.
// This notice may not be removed from this file.

#import <Foundation/Foundation.h>

#if defined (GNUSTEP)
#import <objc/runtime.h>
#elif defined (MACOSX)
// import nothing
#else
#import <objc/objc-runtime.h>
#endif

@interface SenClassEnumerator : NSEnumerator
{
@private

#if defined (GNUSTEP)
    void *state;
    void *_reserved;
#elif defined (MACOSX)
    NSMutableArray	*cleanClasses;
    Class		*classes;
    int			numClasses;
    int			index;
#else
    NXHashTable *class_hash;
    NXHashState state;
#endif

    BOOL isAtEnd;
}

+ (NSEnumerator *) classEnumerator;
@end
