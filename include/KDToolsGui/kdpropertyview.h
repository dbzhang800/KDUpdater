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

#ifndef __KDTOOLS_GUI_KDPROPERTYVIEW_H__
#define __KDTOOLS_GUI_KDPROPERTYVIEW_H__

#include <KDToolsCore/kdtoolsglobal.h>
#include <KDToolsCore/pimpl_ptr.h>

#include <QtGui/QTreeView>

class KDTOOLSGUI_EXPORT KDPropertyView : public QTreeView {
    Q_OBJECT
public:
    explicit KDPropertyView( QWidget* parent = 0 );
    virtual ~KDPropertyView();

    void setModel( QAbstractItemModel* model ) KDAB_OVERRIDE;
    void reset() KDAB_OVERRIDE;

public Q_SLOTS:
    void expand();

protected:
    void drawBranches( QPainter * painter, const QRect & rect, const QModelIndex & index) const KDAB_OVERRIDE;
    void rowsInserted( const QModelIndex & parent, int start, int end ) KDAB_OVERRIDE;

private:
    class Private;
    kdtools::pimpl_ptr<Private> d;
};

#endif /* __KDTOOLS_GUI_KDPROPERTYVIEW_H__ */

