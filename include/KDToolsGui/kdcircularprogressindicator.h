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

#ifndef __KDTOOLS__GUI__KDCIRCULARPROGRESSINDICATOR_H__
#define __KDTOOLS__GUI__KDCIRCULARPROGRESSINDICATOR_H__

#include <QtGui/QWidget>

#include <KDToolsCore/pimpl_ptr>

class KDTOOLSGUI_EXPORT KDCircularProgressIndicator : public QWidget
{
    Q_OBJECT
    Q_PROPERTY( bool active READ isActive WRITE setActive )
    Q_CLASSINFO( "description", "A Mac-style circular (rotating) progress indicator" )
public:
    explicit KDCircularProgressIndicator( QWidget * parent=0 );
    ~KDCircularProgressIndicator();

    bool isActive() const;

    QSize sizeHint() const;
    QSize minimumSizeHint() const;

    int heightForWidth( int w ) const;

public Q_SLOTS:
    void setActive( bool active );

protected:
    void timerEvent( QTimerEvent * );
    void paintEvent( QPaintEvent* event );
    
private:
    class Private;
    kdtools::pimpl_ptr< Private > d;
};

#endif
