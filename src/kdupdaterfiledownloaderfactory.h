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

#ifndef KDUPDATER_KDUPDATERFILEDOWNLOADERFACTORY_H
#define KDUPDATER_KDUPDATERFILEDOWNLOADERFACTORY_H

#include "kdupdater.h"
#include <pimpl_ptr.h>
#include <kdgenericfactory.h>

#include <QtCore/QStringList>
#include <QtCore/QUrl>

QT_BEGIN_NAMESPACE
class QObject;
QT_END_NAMESPACE

namespace KDUpdater
{
    class FileDownloader;

    class KDUPDATER_EXPORT FileDownloaderFactory : public KDGenericFactory< FileDownloader >
    {
        KDAB_DISABLE_COPY( FileDownloaderFactory );
    public:
        static FileDownloaderFactory& instance();
		~FileDownloaderFactory();

        template< typename T >
        void registerFileDownloader( const QString& scheme )
        {
            registerProduct< T >( scheme );
        }
        QStringList supportedSchemes() const;

        int fileDownloaderCount() const;
        FileDownloader* create( const QString& scheme, QObject* parent = 0 ) const;
        static void setFollowRedirects( bool val );
        static bool followRedirects();

    private:
        FileDownloaderFactory();

    private:
        struct FileDownloaderFactoryData;
        kdtools::pimpl_ptr<FileDownloaderFactoryData> d;
    };
}


#endif

