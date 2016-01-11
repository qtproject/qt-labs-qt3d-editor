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
#ifndef LIGHTCOMPONENTPROXYITEM_H
#define LIGHTCOMPONENTPROXYITEM_H

#include <QObject>

namespace Qt3DRender {
class QLight;
class QPhongAlphaMaterial;
}

class EditorSceneItemLightComponentsModel;
class EditorSceneItemComponentsModel;

class LightComponentProxyItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Qt3DRender::QLight* component READ component CONSTANT)
    Q_PROPERTY(EditorSceneItemLightComponentsModel* model READ model CONSTANT)
public:
    explicit LightComponentProxyItem(EditorSceneItemComponentsModel *sceneItemModel,
                                     Qt3DRender::QLight *component,
                                     QObject *parent = 0);
    ~LightComponentProxyItem();

    Qt3DRender::QLight* component() const;

    EditorSceneItemLightComponentsModel* model() const;

    void beginResetComponent(Qt3DRender::QLight *component);
    void endResetComponent();

    void setLightMaterial(Qt3DRender::QPhongAlphaMaterial *lightMaterial);
private:
    Qt3DRender::QLight *m_component;
    EditorSceneItemLightComponentsModel *m_model;
    Qt3DRender::QPhongAlphaMaterial *m_lightMaterial;
};

Q_DECLARE_METATYPE(LightComponentProxyItem*)

#endif // LIGHTCOMPONENTPROXYITEM_H