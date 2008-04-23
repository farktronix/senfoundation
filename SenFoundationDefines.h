/*$Id: SenFoundationDefines.h,v 1.3 2001/03/29 07:41:58 stephane Exp $*/

// Copyright (c) 1997-2001, Sen:te Ltd.  All rights reserved.
//
// Use of this source code is governed by the license in OpenSourceLicense.html
// found in this distribution and at http://www.sente.ch/software/ ,  where the
// original version of this source code can also be found.
// This notice may not be removed from this file.

#if defined(WIN32)
    #undef SENFOUNDATION_EXPORT
    #if defined(BUILDINGSENFOUNDATION)
    #define SENFOUNDATION_EXPORT __declspec(dllexport) extern
    #else
    #define SENFOUNDATION_EXPORT __declspec(dllimport) extern
    #endif
    #if !defined(SENFOUNDATION_IMPORT)
    #define SENFOUNDATION_IMPORT __declspec(dllimport) extern
    #endif
#endif

#if !defined(SENFOUNDATION_EXPORT)
    #define SENFOUNDATION_EXPORT extern
#endif

#if !defined(SENFOUNDATION_IMPORT)
    #define SENFOUNDATION_IMPORT extern
#endif

#if !defined(SENFOUNDATION_STATIC_INLINE)
#define SENFOUNDATION_STATIC_INLINE static __inline__
#endif

#if !defined(SENFOUNDATION_EXTERN_INLINE)
#define SENFOUNDATION_EXTERN_INLINE extern __inline__
#endif
