/*$Id: NSArray_SenAdditions.m,v 1.4 2001/10/03 15:36:18 stephane Exp $*/

// Copyright (c) 1997-2001, Sen:te Ltd.  All rights reserved.
//
// Use of this source code is governed by the license in OpenSourceLicense.html
// found in this distribution and at http://www.sente.ch/software/ ,  where the
// original version of this source code can also be found.
// This notice may not be removed from this file.


#import "NSArray_SenAdditions.h"
#import "SenEmptiness.h"

@implementation NSArray (SenAdditions)
- (id) firstObject
{
    return [self isEmpty] ? nil : [self objectAtIndex:0];
}


- (BOOL) containsObjectIdenticalTo:(id) anObject
{
    return [self indexOfObjectIdenticalTo:anObject] != NSNotFound;
}

- (id) senDeepMutableCopy
{
    NSMutableArray	*aCopy = [[NSMutableArray alloc] initWithCapacity:[self count]];
    NSEnumerator	*anEnum = [self objectEnumerator];
    id				anObject;

    while(anObject = [anEnum nextObject]){
        id	anObjectCopy;

        if([anObject respondsToSelector:@selector(senDeepMutableCopy)])
            anObjectCopy = [anObject senDeepMutableCopy];
        else if([anObject respondsToSelector:@selector(mutableCopy)])
            anObjectCopy = [anObject mutableCopy];
        else if([anObject respondsToSelector:@selector(copy)])
            anObjectCopy = [anObject copy];
        else
            anObjectCopy = [anObject retain];
        [aCopy addObject:anObjectCopy];
        [anObjectCopy release];
    }

    return aCopy;
}

@end
