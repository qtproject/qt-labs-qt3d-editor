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
import QtQuick 2.4
import com.theqtcompany.Editor3d 1.0

MaterialDelegate {
    id: thisDelegate
    componentType: EditorSceneItemComponentsModel.Material
    title: qsTr("Phong Alpha")

    ColorPropertyInputField {
        label: qsTr("Ambient Color")
        propertyName: "ambient"
        component: materialComponentData
        componentType: thisDelegate.componentType
    }

    ColorPropertyInputField {
        label: qsTr("Diffuse Color")
        propertyName: "diffuse"
        component: materialComponentData
        componentType: thisDelegate.componentType
    }

    ColorPropertyInputField {
        label: qsTr("Specular Color")
        propertyName: "specular"
        component: materialComponentData
        componentType: thisDelegate.componentType
    }

    FloatPropertyInputField {
        label: qsTr("Shininess")
        propertyName: "shininess"
        component: materialComponentData
        componentType: thisDelegate.componentType
    }

    FloatPropertyInputField {
        label: qsTr("Alpha")
        propertyName: "alpha"
        component: materialComponentData
        componentType: thisDelegate.componentType
    }
}
