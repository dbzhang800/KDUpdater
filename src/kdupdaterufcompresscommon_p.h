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

#ifndef __KDTOOLS_KDUPDATERUFCOMPRESSCOMMON_P_H__
#define __KDTOOLS_KDUPDATERUFCOMPRESSCOMMON_P_H__

#define KD_UPDATER_UF_HEADER_MAGIC "KDVCLZ"

#include <kdtoolsglobal.h>

#include <QtCore/QStringList>
#include <QtCore/QByteArray>
#include <QtCore/QVector>

QT_BEGIN_NAMESPACE
class QCryptographicHash;
class QDataStream;
QT_END_NAMESPACE

namespace KDUpdater
{
    struct KDUPDATER_EXPORT UFHeader
    {
        QString magic;
        QStringList fileList;
        QVector<quint64> permList;
        QVector<bool> isDirList;

        bool isValid() const;

        void addToHash( QCryptographicHash& hash ) const;
    };

    struct KDUPDATER_EXPORT UFEntry
    {
        QString fileName;
        quint64 permissions;
        QByteArray fileData;

        UFEntry();

        bool isValid() const;

        void addToHash(QCryptographicHash& hash) const;
    };

    KDUPDATER_EXPORT QDataStream& operator<<( QDataStream& stream, const UFHeader& hdr );
    KDUPDATER_EXPORT QDataStream& operator>>( QDataStream& stream, UFHeader& hdr );

    KDUPDATER_EXPORT QDataStream& operator<<( QDataStream& stream, const UFEntry& entry );
    KDUPDATER_EXPORT QDataStream& operator>>( QDataStream& stream, UFEntry& entry );
}

#endif
