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

#ifndef __KDTOOLS__GUI__KDPAINTERSAVER_H__
#define __KDTOOLS__GUI__KDPAINTERSAVER_H__

#include <KDToolsCore/kdtoolsglobal.h>

#include <QtGui/QPen>
#include <QtGui/QBrush>
#include <QtGui/QFont>
#include <QtGui/QTransform>

QT_BEGIN_NAMESPACE
class QPainter;
QT_END_NAMESPACE

class KDTOOLSGUI_EXPORT KDPainterSaver KDAB_FINAL_CLASS {
    Q_DISABLE_COPY( KDPainterSaver )
public:
    explicit KDPainterSaver( QPainter * p );
    explicit KDPainterSaver( QPainter & p );
    ~KDPainterSaver();

private:
    QPainter * painter;
};

// "class" and "KDTOOLSGUI_EXPORT" are split in two lines so that the header generator does not
// generate an undesired forwarding header called "KD"

#define MAKE_PAINTER_SAVER( Type, type )                        \
    class                                                       \
          KDTOOLSGUI_EXPORT KD##Type##Saver KDAB_FINAL_CLASS {  \
        Q_DISABLE_COPY( KD##Type##Saver )                       \
    public:                                                     \
        typedef int doxygen_doesn_t_parse_first_two_lines;      \
        typedef int so_work_around_it;                          \
        KD##Type##Saver( QPainter * p, const Q##Type & type );  \
        explicit KD##Type##Saver( QPainter * p );               \
        KD##Type##Saver( QPainter & p, const Q##Type & type );  \
        explicit KD##Type##Saver( QPainter & p );               \
        ~KD##Type##Saver();                                     \
    private:                                                    \
        const Q##Type type;                                     \
        QPainter * const painter;                               \
    }

MAKE_PAINTER_SAVER( Pen, pen );
MAKE_PAINTER_SAVER( Brush, brush );
MAKE_PAINTER_SAVER( Font, font );
MAKE_PAINTER_SAVER( Transform, transform );
#undef MAKE_PAINTER_SAVER


#endif /* __KDTOOLS__GUI__KDPAINTERSAVER_H__ */

