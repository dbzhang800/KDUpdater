/****************************************************************************
** Copyright (C) 2001-2012 Klaralvdalens Datakonsult AB.  All rights reserved.
**
** This file is part of the KD Tools library.
**
** Licensees holding valid commercial KD Tools licenses may use this file in
** accordance with the KD Tools Commercial License Agreement provided with
** the Software.
**
**
** This file may be distributed and/or modified under the terms of the GNU
** Lesser General Public License version 2 and version 3 as published by the
** Free Software Foundation and appearing in the file LICENSE.LGPL included.
**
** This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
** WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
**
** Contact info@kdab.net if any conditions of this licensing are not
** clear to you.
**
**********************************************************************/

#ifndef __KDTOOLS_GUI_MACWIDGETS_P_H__
#define __KDTOOLS_GUI_MACWIDGETS_P_H__

#include <QtCore/QtGlobal>
QT_BEGIN_NAMESPACE
class QString;
class QStyle;
QT_END_NAMESPACE

namespace _macwidget {
    // returns the complete resource path and makes sure the resource
    // was initialized
    QString RESOURCE( const char * name );
#ifdef Q_WS_MAC
    bool isMacStyle( const QStyle * style );
#else
    inline bool isMacStyle( const QStyle * ) { return false; }
#endif
}

#endif /* __KDTOOLS_GUI_MACWIDGETS_P_H__ */
