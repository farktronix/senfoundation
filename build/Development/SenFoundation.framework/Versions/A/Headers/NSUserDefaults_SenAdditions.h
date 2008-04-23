/*$Id: NSUserDefaults_SenAdditions.h,v 1.3 2001/03/29 07:39:10 stephane Exp $*/

// Copyright (c) 1997-2001, Sen:te Ltd.  All rights reserved.
//
// Use of this source code is governed by the license in OpenSourceLicense.html
// found in this distribution and at http://www.sente.ch/software/ ,  where the
// original version of this source code can also be found.
// This notice may not be removed from this file.

#import <Foundation/Foundation.h>

@interface NSUserDefaults (SenAdditions)

+ (void) registerDefaultsFromBundle:(NSBundle *) aBundle;

@end
