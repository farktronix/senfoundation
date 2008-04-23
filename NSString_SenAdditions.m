/*$Id: NSString_SenAdditions.m,v 1.4 2001/03/29 07:39:10 stephane Exp $*/

// Copyright (c) 1997-2001, Sen:te Ltd.  All rights reserved.
//
// Use of this source code is governed by the license in OpenSourceLicense.html
// found in this distribution and at http://www.sente.ch/software/ ,  where the
// original version of this source code can also be found.
// This notice may not be removed from this file.

#import "NSString_SenAdditions.h"
#import "SenCollection.h"
#import <Foundation/Foundation.h>

#define NT_PATH_SEPARATOR  @"\\"
#define UNIX_PATH_SEPARATOR @"/"

@implementation NSString (SenAdditions)
- (NSString *) asUnixPath
{
    NSArray *components = [[[self pathComponents] collectionByRejectingWithSelector:@selector(isEqualToString:) withObject:NT_PATH_SEPARATOR] asArray];
    return [[components componentsJoinedByString:UNIX_PATH_SEPARATOR] stringByStandardizingPath];
}

- (NSArray *) componentsSeparatedBySpace
{
    NSCharacterSet *space = [NSCharacterSet whitespaceCharacterSet];
    NSMutableArray *elements = [NSMutableArray array];
    NSScanner *elementScanner = [NSScanner scannerWithString:self];
    while (![elementScanner isAtEnd]) {
        NSString *element;
        if ([elementScanner scanUpToCharactersFromSet:space intoString:&element]) {
            [elements addObject:element];
        }
    }
    return elements;
}


@end
