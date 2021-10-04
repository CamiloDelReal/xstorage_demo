import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

import "qrc:/qml"
import "qrc:/qml/views"

XTitledPage {
    id: homePage
    statusbarHeight: ApplicationManagerObj.systemStatusBarSize

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
