import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14
import QtQuick.Layouts 1.14

import "qrc:/qml"

import XApps.XMaterialControls 1.0

XScrollView {
    id: storageDetailsView
    ScrollIndicator.vertical: ScrollIndicator {}

    property var storageLabelType: {
        0: qsTr("Unkwon"),          //UNKNOWN
        1: qsTr("Root"),            //ROOT
        2: qsTr("Internal Memory"), //INTERNAL
        3: qsTr("SD Card"),         //SDCARD
        4: qsTr("USB Device"),      //USB
        5: qsTr("Hard Disk")        //HDD
    }

    property var modelData: StorageManagerObj.model.itemAt(sharedData)

    Flow {
        id: contentLayout
        layoutDirection: Qt.LeftToRight
        flow: Flow.LeftToRight
        anchors.fill: parent
        spacing: 15

        Pane {
            id: storageDevicePane
            padding: 0
            width: appRoot.isPortrait
                   ? (storageDetailsView.width - storageDetailsView.leftPadding - storageDetailsView.rightPadding)
                   : storageDeviceLayout.implicitWidth + 20
            height: storageDeviceLayout.implicitHeight

            GridLayout {
                id: storageDeviceLayout
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.rightMargin: 10
                columns: 2
                columnSpacing: 8
                rowSpacing: 8

                XTitleLabel {
                    text: qsTr("Storage")
                    color: {
                        if(storageDetailsView.Material.theme === Material.Light && !XMaterialControls.isDarkColor(storageDetailsView.Material.accent))
                            return Material.color(ApplicationSettingsObj.accentColor, Material.Shade800)
                        else if(storageDetailsView.Material.theme === Material.Dark && XMaterialControls.isDarkColor(storageDetailsView.Material.accent))
                            return Material.color(ApplicationSettingsObj.accentColor, Material.Shade100)
                        else
                            return storageDetailsView.Material.accent
                    }

                    Layout.columnSpan: 2
                }

                XBodyLabel1 {
                    text: qsTr("Label:")
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                    leftPadding: 30
                }
                XBodyLabel1 {
                    id: lblStorageName
                    text: modelData.name
                    wrapMode: Label.WrapAnywhere
                    Layout.fillWidth: true
                }

                XBodyLabel1 {
                    text: qsTr("Type:")
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                }
                XBodyLabel1 {
                    id: lblStorageType
                    text: storageLabelType[modelData.type]
                    wrapMode: Label.WrapAnywhere
                    Layout.fillWidth: true
                }

                XBodyLabel1 {
                    text: qsTr("Primary:")
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                }
                XBodyLabel1 {
                    id: lblStorageIsPrimary
                    text: modelData.isPrimary ? qsTr("Si") : qsTr("No")
                    wrapMode: Label.WrapAnywhere
                    Layout.fillWidth: true
                }

                XBodyLabel1 {
                    text: qsTr("Removable:")
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                }
                XBodyLabel1 {
                    id: lblStorageIsRemovable
                    text: modelData.isRemovable ? qsTr("Si") : qsTr("No")
                    wrapMode: Label.WrapAnywhere
                    Layout.fillWidth: true
                }

                XBodyLabel1 {
                    text: qsTr("Size:")
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                }
                XBodyLabel1 {
                    id: lblStorageTotalSize
                    text: modelData.totalSizeStr
                    wrapMode: Label.WrapAnywhere
                    Layout.fillWidth: true
                }

                XBodyLabel1 {
                    text: qsTr("Free space:")
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                }
                XBodyLabel1 {
                    id: lblStorageFreeSize
                    text: modelData.freeSizeStr
                    wrapMode: Label.WrapAnywhere
                    Layout.fillWidth: true
                }
            }
        }

        Pane {
            padding: 0
            width: appRoot.isPortrait
                   ? (storageDetailsView.width - storageDetailsView.leftPadding - storageDetailsView.rightPadding)
                   : (storageDetailsView.width - storageDetailsView.leftPadding - storageDetailsView.rightPadding - 15 - storageDevicePane.width)
            height: mountPointLayout.implicitHeight

            GridLayout {
                id: mountPointLayout
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.rightMargin: 10
                columns: 2
                columnSpacing: 8
                rowSpacing: 8

                XTitleLabel {
                    text: qsTr("Moint Point")
                    color: {
                        if(storageDetailsView.Material.theme === Material.Light && !XMaterialControls.isDarkColor(storageDetailsView.Material.accent))
                            return Material.color(ApplicationSettingsObj.accentColor, Material.Shade800)
                        else if(storageDetailsView.Material.theme === Material.Dark && XMaterialControls.isDarkColor(storageDetailsView.Material.accent))
                            return Material.color(ApplicationSettingsObj.accentColor, Material.Shade100)
                        else
                            return storageDetailsView.Material.accent
                    }
                    Layout.columnSpan: 2
                }

                XBodyLabel1 {
                    text: qsTr("Path:")
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                    Layout.fillWidth: false
                }

                XBodyLabel1 {
                    id: lblStoragePath
                    text: modelData.path
                    wrapMode: Label.WrapAnywhere
                    Layout.fillWidth: true
                }

                XBodyLabel1 {
                    text: qsTr("Device:")
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                }

                XBodyLabel1 {
                    id: lblStorageDevice
                    text: modelData.device
                    wrapMode: Label.WrapAnywhere
                    Layout.fillWidth: true
                }

                XBodyLabel1 {
                    text: qsTr("Read/Write:")
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                }

                XBodyLabel1 {
                    id: lblStorageAllowReadWrite
                    text: modelData.allowReadWrite ? qsTr("Yes") : qsTr("No")
                    wrapMode: Label.WrapAnywhere
                    Layout.fillWidth: true
                }

                XBodyLabel1 {
                    text: qsTr("File System:")
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                }

                XBodyLabel1 {
                    id: lblStorageFileSystem
                    text: modelData.fileSystem
                    wrapMode: Label.WrapAnywhere
                    Layout.fillWidth: true
                }
            }
        }
    }
}
