import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

import "qrc:/qml"
import "qrc:/qml/views"

XTitledPage {
    id: homePage
    statusBarHeight: ApplicationManagerObj.systemStatusBarSize

    titlebar.title: qsTr("XStorage Demo")
    titlebar.primaryAction: homeNavController.depth > 1
                            ? primaryAction
                            : null

    XAction {
        id: primaryAction
        text: qsTr("Open global drawer")
        icon.source: "qrc:/img/icons/arrow-left.svg"
        onTriggered: homePage.back()
    }

    function back() {
        if(homeNavController.depth > 1) {
            homeNavController.goBack()
            return true
        }
        return false
    }

    XViewNavController {
        id: homeNavController
        anchors.fill: parent

        initialView: StorageListingView {}
    }
}
