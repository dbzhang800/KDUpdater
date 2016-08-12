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

#include "mainwindow.h"
#include "updaterdialog.h"

#include <QTextBrowser>
#include <QMenuBar>
#include <QMenu>
#include <QApplication>

#include <QtCore/QProcess>
#include <QtCore/QDir>

#include <iostream>

class MainWindow::Private : public QObject
{
    Q_OBJECT
public:
    explicit Private( MainWindow* parent = NULL );
    ~Private();
    void init();

private:
    void createMenus();
    void createWidgets();

private:
    MainWindow* m_parent;
    QTextBrowser * m_display;

private Q_SLOTS:
    void showUpdaterDialog();
    void closeAndRestart();
};

MainWindow::Private::Private( MainWindow* parent):
        m_parent( parent ),
        m_display( NULL )
{
}

MainWindow::Private::~Private()
{

}

void MainWindow::Private::createWidgets()
{
    m_display = new QTextBrowser( m_parent );
    m_parent->setCentralWidget( m_display );
    const QString text = tr( "Version %1" ).arg( QLatin1String( APP_VERSION ) );
    m_display->setPlainText( text );
    QFont font = m_display->currentFont();
    font.setPointSize( 100 );
    m_display->setFont( font );
}

void MainWindow::Private::init()
{
    createWidgets();
    createMenus();

}

void MainWindow::Private::createMenus()
{
    QMenu* updaterMenu = m_parent->menuBar()->addMenu( tr( "&Updater" ) );
    updaterMenu->addAction( tr( "check for &updates" ), this, SLOT(showUpdaterDialog()) );
}

void MainWindow::Private::closeAndRestart()
{
    QStringList arguments;
    arguments.append( QString::fromLatin1( "--copy" ) );
    arguments.append( qApp->applicationFilePath() );
    const int extIndex = qApp->applicationFilePath().lastIndexOf( QLatin1Char( '.' ) );
    const QString appFileExtension( extIndex >= 0 ? qApp->applicationFilePath().mid( extIndex ) : QString() );
    const QString appName( qApp->applicationFilePath().mid( 0, extIndex ) );
    const QString updatedAppFileName( appName + QString::fromLatin1( "tmp" ) + appFileExtension );
    const QString startAppName( QFileInfo( updatedAppFileName ).absoluteFilePath() );
    std::cout << appFileExtension.toStdString().c_str() << std::endl;
    std::cout << appName.toStdString().c_str()<< std::endl;
    std::cout << updatedAppFileName.toStdString().c_str() << std::endl;
    std::cout << startAppName.toStdString().c_str() << std::endl;
    QProcess::startDetached( startAppName, arguments, QDir::currentPath( ) );
    m_parent->close();
}

void MainWindow::Private::showUpdaterDialog()
{
    UpdaterDialog d;
    connect( &d, SIGNAL(accepted()), this, SLOT(closeAndRestart()) );
    d.exec();
}


MainWindow::MainWindow( QWidget *parent ) :
    QMainWindow( parent ),
    d ( new Private( this ) )
{
    d->init();
}

MainWindow::~MainWindow()
{

}
#include "mainwindow.moc"
