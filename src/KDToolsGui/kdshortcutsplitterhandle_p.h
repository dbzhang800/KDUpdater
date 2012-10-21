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

#ifndef __KDTOOLS__GUI__KDSHORTCUTSPLITTERHANDLE_P_H__
#define __KDTOOLS__GUI__KDSHORTCUTSPLITTERHANDLE_P_H__

#include <QtGui/QSplitterHandle>

/***********************************************
 *          KDSHORTCUTSplitterHandle
 **********************************************/

/* internal */
class KDShortcutSplitterHandle : public QWidget {
  Q_OBJECT
public:
  explicit KDShortcutSplitterHandle( QWidget* parent = 0 );

  void setStepSize(int);
  int stepSize() const { return m_stepsize; }

  void setIncrementFromBottom(bool b);
  bool incrementFromBottom() const { return m_incrementfrombottom; }

  virtual QSize sizeHint() const;

Q_SIGNALS:
 void splitterMovedUp();
 void splitterMovedDown();
protected:

  virtual void paintEvent(QPaintEvent* e);
  virtual void enterEvent(QEvent* e);
  virtual void leaveEvent(QEvent* e);
  virtual void mousePressEvent(QMouseEvent* e);
  virtual void mouseMoveEvent(QMouseEvent* e);
private:
  int m_stepsize;
  bool m_incrementfrombottom;
  bool m_hover;
};


#endif /* __KDTOOLS__GUI__KDSHORTCUTSPLITTERHANDLE_P_H__ */

