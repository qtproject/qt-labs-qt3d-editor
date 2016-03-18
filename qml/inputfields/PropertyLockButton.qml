/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt3D Editor of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL-EXCEPT$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4

EnableButton {
    property string lockProperty: editorScene.lockPropertySuffix
    property string label: "" // Dummy label, needs to be set by using component
    property var lockComponent: null
    property bool locked: false

    enabledIconSource: "/images/lock_open.png"
    disabledIconSource: "/images/lock_locked.png"
    tooltip: qsTr("Lock '%1' Properties").arg(label) + editorScene.emptyString
    buttonEnabled: !locked

    Component.onCompleted: {
        if (selectedEntity) {
            var propertyLocked = selectedEntity.customProperty(lockComponent, lockProperty)
            if (propertyLocked != undefined)
                locked = propertyLocked
        }

    }

    onEnabledButtonClicked: {
        locked = !locked
        selectedEntity.setCustomProperty(lockComponent, lockProperty, locked)
    }
}