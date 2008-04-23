/*$Id: NSArray_SenAdditions.h,v 1.4 2001/10/03 15:36:18 stephane Exp $*/

// Copyright (c) 1997-2001, Sen:te Ltd.  All rights reserved.
//
// Use of this source code is governed by the license in OpenSourceLicense.html
// found in this distribution and at http://www.sente.ch/software/ ,  where the
// original version of this source code can also be found.
// This notice may not be removed from this file.

#import <Foundation/Foundation.h>

@interface NSArray (SenAdditions)
- (id) firstObject;
- (BOOL) containsObjectIdenticalTo:(id)anObject;

- (id) senDeepMutableCopy;
// Returned object is retained (like with copy)
// Each item is tested against methods senDeepMutableCopy, mutableCopy or copy. If
// item responds to none of these methods, it is reused by the copy.

@end
