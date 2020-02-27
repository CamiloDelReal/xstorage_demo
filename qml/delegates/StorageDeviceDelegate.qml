import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.14

import XApps.XMaterialControls 1.0

import "qrc:/qml"

ItemDelegate {
    id: control
    padding: 7
    leftPadding: 12
    rightPadding: 12
    width: storageListView.width

    contentItem: RowLayout {
        height: implicitHeight
        spacing: 10

        Rectangle {
            id: iconViewContainer
            height: 36
            width: 36
            color: control.Material.primary
            Layout.alignment: Qt.AlignVCenter
            radius: 7.2

            IconLabel {
                id: image
                anchors.centerIn: parent
                icon.source: storageListingView.iconType[type]
                icon.width: 20
                icon.height: 20
                icon.color: XMaterialControls.isDarkColor(control.Material.primary) ? "#FFFFFFFF" : "#DD000000"
            }
        }

        ColumnLayout {
            id: contentItemCol
            Layout.alignment: Qt.AlignVCenter
            spacing: 6

            XBodyLabel1 {
                id: lblName
                text: name
                Layout.fillHeight: true
                Layout.fillWidth: true
                horizontalAlignment: Label.AlignLeft
                verticalAlignment: Label.AlignBottom
                maximumLineCount: 1
                elide: Label.ElideRight

                XCaptionLabel {
                    id: lblPercentStr
                    text: usedPercent + "%"
                    color: control.Material.secondaryTextColor
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                }
            }

            ProgressBar {
                id: pgbUsedPercent
                Layout.fillWidth: true
                value: usedPercent / 100
                Material.accent: (usedPercent <= 50
                                  ? Material.Green
                                  : (usedPercent <= 90
                                     ? Material.Orange
                                     : Material.Red))
            }

            XCaptionLabel {
                id: lblSizes
                text: freeSizeStr + qsTr("  free of  ") + totalSizeStr
                color: control.Material.secondaryTextColor
                Layout.fillWidth: true
                horizontalAlignment: Label.AlignLeft
                maximumLineCount: 1
                elide: Label.ElideRight
            }
        }
    }
}
