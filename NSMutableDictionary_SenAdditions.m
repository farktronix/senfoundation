/*$Id: NSMutableDictionary_SenAdditions.m,v 1.5 2001/10/03 15:36:18 stephane Exp $*/

// Copyright (c) 1997-2001, Sen:te Ltd.  All rights reserved.
//
// Use of this source code is governed by the license in OpenSourceLicense.html
// found in this distribution and at http://www.sente.ch/software/ ,  where the
// original version of this source code can also be found.
// This notice may not be removed from this file.

#import "NSMutableDictionary_SenAdditions.h"
@implementation NSDictionary (SenAdditions)
- (id) objectForInt:(int) anInt
{
    return [self objectForKey:[[NSNumber numberWithInt:anInt] stringValue]];
}

- (id) senDeepMutableCopy
{
    NSMutableDictionary	*aCopy = [[NSMutableDictionary alloc] initWithCapacity:[self count]];
    NSEnumerator		*anEnum = [self keyEnumerator];
    id					aKey;

    while(aKey = [anEnum nextObject]){
        id	aKeyCopy;
        id	aValueCopy;
        id	aValue = [self objectForKey:aKey];

        if([aKey respondsToSelector:@selector(senDeepMutableCopy)])
            aKeyCopy = [aKey senDeepMutableCopy];
        else if([aKey respondsToSelector:@selector(mutableCopy)])
            aKeyCopy = [aKey mutableCopy];
        else if([aKey respondsToSelector:@selector(copy)])
            aKeyCopy = [aKey copy];
        else
            aKeyCopy = [aKey retain];
        if([aValue respondsToSelector:@selector(senDeepMutableCopy)])
            aValueCopy = [aValue senDeepMutableCopy];
        else if([aValue respondsToSelector:@selector(mutableCopy)])
            aValueCopy = [aValue mutableCopy];
        else if([aValue respondsToSelector:@selector(copy)])
            aValueCopy = [aValue copy];
        else
            aValueCopy = [aValue retain];
        [aCopy setObject:aValueCopy forKey:aKeyCopy];
        [aKeyCopy release];
        [aValueCopy release];
    }

    return aCopy;
}

@end

@implementation NSMutableDictionary (SenAdditions)
- (id) objectForKey:(id) aKey setObjectIfAbsent:(id) anObject
{
    id value = [self objectForKey:aKey];
    if (value == nil){
        [self setObject:anObject forKey:aKey];
        return anObject;
    }
    return value;
}
@end
