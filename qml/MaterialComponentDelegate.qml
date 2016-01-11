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
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.2
import Qt3D.Render 2.0

ComponentDelegate {
    id: materialDelegate
    title: qsTr("Material")

    property int currentMaterial: 0

    Item {
        width: parent.width
        height: title.height + 8

        Component.onCompleted: materialCombobox.currentIndex = materialDelegate.currentMaterial - 1

        RowLayout {
            anchors.right: parent.right
            anchors.rightMargin: 4
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.bottomMargin: 4
            anchors.verticalCenter: parent.verticalCenter

            Label {
                id: title
                text: qsTr("Material")
                color: labelTextColor
                Layout.alignment: Qt.AlignLeft
            }

            ComboBox {
                id: materialCombobox
                Layout.alignment: Qt.AlignRight
                model: ListModel {
                    ListElement { text: qsTr("DiffuseMap") }
                    ListElement { text: qsTr("DiffuseSpecularMap") }
                    ListElement { text: qsTr("Gooch") }
                    ListElement { text: qsTr("NormalDiffuseMap") }
                    ListElement { text: qsTr("NormalDiffuseMapAlpha") }
                    ListElement { text: qsTr("NormalDiffuseSpecularMap") }
                    ListElement { text: qsTr("PerVertexColor") }
                    ListElement { text: qsTr("PhongAlpha") }
                    ListElement { text: qsTr("Phong") }
                }
                onCurrentTextChanged: {
                    if (currentText == "DiffuseMap")
                        componentData.model.setMaterial(EditorSceneItemMaterialComponentsModel.DiffuseMap)
                    else if (currentText == "DiffuseSpecularMap")
                        componentData.model.setMaterial(EditorSceneItemMaterialComponentsModel.DiffuseSpecularMap)
                    else if (currentText == "Gooch")
                        componentData.model.setMaterial(EditorSceneItemMaterialComponentsModel.Gooch)
                    else if (currentText == "NormalDiffuseMap")
                        componentData.model.setMaterial(EditorSceneItemMaterialComponentsModel.NormalDiffuseMap)
                    else if (currentText == "NormalDiffuseSpecularMap")
                        componentData.model.setMaterial(EditorSceneItemMaterialComponentsModel.NormalDiffuseSpecularMap)
                    else if (currentText == "PerVertexColor")
                        componentData.model.setMaterial(EditorSceneItemMaterialComponentsModel.PerVertexColor)
                    else if (currentText == "PhongAlpha")
                        componentData.model.setMaterial(EditorSceneItemMaterialComponentsModel.PhongAlpha)
                    else if (currentText == "Phong")
                        componentData.model.setMaterial(EditorSceneItemMaterialComponentsModel.Phong)
                }
            }
        }
    }

    Repeater {
        id: materialRepeater
        model: componentData.model

        Loader {
            id: materialLoader
            width: parent.width

            function materialTypetoDelegateSource(materialType) {
                materialDelegate.currentMaterial = materialType
                if (materialType == EditorSceneItemMaterialComponentsModel.DiffuseMap)
                    return "DiffuseMapMaterialDelegate.qml";
                if (materialType == EditorSceneItemMaterialComponentsModel.DiffuseSpecularMap)
                    return "DiffuseSpecularMapMaterialDelegate.qml";
                if (materialType == EditorSceneItemMaterialComponentsModel.Gooch)
                    return "GoochMaterialDelegate.qml";
                if (materialType == EditorSceneItemMaterialComponentsModel.NormalDiffuseMap)
                    return "NormalDiffuseMapMaterialDelegate.qml";
                if (materialType == EditorSceneItemMaterialComponentsModel.NormalDiffuseMapAlpha)
                    return "NormalDiffuseMapAlphaMaterialDelegate.qml";
                if (materialType == EditorSceneItemMaterialComponentsModel.NormalDiffuseSpecularMap)
                    return "NormalDiffuseSpecularMapMaterialDelegate.qml";
                if (materialType == EditorSceneItemMaterialComponentsModel.PerVertexColor)
                    return "PerVertexColorMaterialDelegate.qml";
                if (materialType == EditorSceneItemMaterialComponentsModel.PhongAlpha)
                    return "PhongAlphaMaterialDelegate.qml";
                if (materialType == EditorSceneItemMaterialComponentsModel.Phong)
                    return "PhongMaterialDelegate.qml";

                return "UnknownMaterialDelegate.qml";
            }

            source: materialTypetoDelegateSource(materialType)
        }
    }
}
