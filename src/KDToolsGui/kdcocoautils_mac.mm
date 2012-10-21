#include <Foundation/NSString.h>

#include "kdcocoautils.h"

/*!
  \class KDCocoaUtils KDCocoaUtils
  \ingroup gui
  \brief Mac OS X Cocoa related convenience functions.

  KDCocoaUtils contains a bunch of functions for programming
  with Qt on Cocoa on Mac OS X.
*/

/*!
 Converts \a string from QString to a Cocoa NSString.
 Note that the caller takes ownership of the returned pointer.

 \since_f 2.3.
 */
NSString* KDCocoaUtils::fromQString( const QString& string )
{
    return [[NSString alloc] initWithUTF8String:string.toUtf8().data() ];
}

/*!
 Converts \a string from Cocoa NSString to a QString.

 \since_f 2.3.
 */
QString KDCocoaUtils::toQString( const NSString* string )
{
    return string ? QString::fromUtf8([string UTF8String]) : QString();
}
