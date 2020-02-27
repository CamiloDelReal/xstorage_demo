import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

import "qrc:/qml"
import "qrc:/qml/delegates"


XPane {
    id: storageListingView
    title: qsTr("Storages Devices")

    property var iconType: {
        "Unknown": "qrc:/img/icons/alert-octagram.svg",
        "Root": "qrc:/img/icons/lock.svg",
        "Internal": "qrc:/img/icons/cellphone-android.svg",
        "SdCard": "qrc:/img/icons/micro-sd.svg",
        "Usb": "qrc:/img/icons/usb.svg",
        "Hdd": "qrc:/img/icons/harddisk.svg"
    }

    ListView {
        id: storageListView
        anchors.fill: parent
        ScrollIndicator.vertical: ScrollIndicator {}
        model: StorageManagerObj.model
        delegate: StorageDeviceDelegate {}
    }

    Rectangle {
        anchors.fill: parent
        color: storageListingView.Material.background
        visible: opacity > 0
        opacity: StorageManagerObj.model.count === 0 ? 1 : 0
        Behavior on opacity { NumberAnimation { duration: 150 } }

        ColumnLayout {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right

            IconLabel {
                Layout.alignment: Qt.AlignHCenter
                icon.source: "qrc:/img/icons/alert.svg"
                icon.color: storageListingView.Material.secondaryTextColor
                icon.width: 50
                icon.height: 50
            }

            XCaptionLabel {
                Layout.alignment: Qt.AlignHCenter
                Layout.leftMargin: 50
                Layout.rightMargin: 50
                Layout.fillWidth: true
                text: qsTr("No devices storages detected")
                horizontalAlignment: Label.AlignHCenter
                wrapMode: Label.WordWrap
                color: storageListingView.Material.secondaryTextColor
            }
        }
    }

    XPane {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 16
        radius: height / 2
        Material.elevation: 3
        padding: 2
        visible: opacity > 0
        opacity: StorageManagerObj.isWorking ? 1 : 0
        Behavior on opacity { NumberAnimation { duration: 100 } }

        BusyIndicator {
            anchors.centerIn: parent
            implicitWidth: 32
            implicitHeight: 32
        }
    }

    XRoundButton {
        id: btnNew
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        icon.source: "qrc:/img/icons/refresh.svg"
        onClicked: StorageManagerObj.update()
    }
}
