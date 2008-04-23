/*$Id: SenFileSystemTree.h,v 1.4 2001/10/02 16:07:02 phink Exp $*/

// Copyright (c) 1997-2001, Sen:te Ltd.  All rights reserved.
//
// Use of this source code is governed by the license in OpenSourceLicense.html
// found in this distribution and at http://www.sente.ch/software/ ,  where the
// original version of this source code can also be found.
// This notice may not be removed from this file.

#import <Foundation/NSObject.h>
#import "SenTrees.h"


@interface SenFileSystemTree : NSObject <SenTrees, NSCopying>
{
//    @private
    NSString	*path;
}

+ (id <SenTrees>) treeAtPath:(NSString *)value; // Will cache returned value; never returns nil
+ (id <SenTrees>) fileAtPath:(NSString *)value; // Returns value from cache only => may return nil

- (NSString *) path;
- (BOOL) isLeaf;
- (NSString *) value; // Returns last path component

@end
