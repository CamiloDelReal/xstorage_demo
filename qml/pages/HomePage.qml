import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14
import QtQuick.Layouts 1.14

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
        text: qsTr("Back")
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

        property int storageDetailsViewIndex: 0
        viewNavigationModel: [
            { view: "views/StorageDetailsView.qml",  stacked: true }
        ]
    }
}
