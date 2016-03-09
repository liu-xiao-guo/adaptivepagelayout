import QtQuick 2.4
import Ubuntu.Components 1.3

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "adaptivepagelayout.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    width: units.gu(100)
    height: units.gu(70)

    AdaptivePageLayout {
        id: layout
        anchors.fill: parent
        primaryPage: rootPage

        Page {
            id: rootPage
            title: i18n.tr("Root page")

            Rectangle {
                id: rect
                anchors.fill: parent
                color: "red"
                border.color: "green"
                border.width: units.gu(1)

                Component.onCompleted: {
                    console.log("rect size: " + rect.width + " " + rect.height)
                }
            }

            Column {
                anchors {
                    top: parent.top
                    left: parent.left
                    margins: units.gu(1)
                }
                spacing: units.gu(1)

                Button {
                    text: "Add page left"
                    onClicked: layout.addPageToCurrentColumn(rootPage, leftPage)
                }
                Button {
                    text: "Add page right"
                    onClicked: layout.addPageToNextColumn(rootPage, rightPage)
                }
                Button {
                    text: "Add sections page right"
                    onClicked: layout.addPageToNextColumn(rootPage, sectionsPage)
                }
            }

            Component.onCompleted: {
                console.log("Initial rootpage size: " + rootPage.width + " " + rootPage.height)
            }

            onWidthChanged: {
                console.log("rootPage width changed: " + rootPage.width)
            }
        }

        Page {
            id: leftPage
            title: i18n.tr("First column")

            Rectangle {
                anchors {
                    fill: parent
                    margins: units.gu(2)
                }
                color: UbuntuColors.orange

                Button {
                    anchors.centerIn: parent
                    text: "right"
                    onTriggered: layout.addPageToNextColumn(leftPage, rightPage)
                }
            }

            Component.onCompleted: {
                console.log("Initial leftPage size: " + leftPage.width + " " + leftPage.height)
            }

            onWidthChanged: {
                console.log("leftPage width changed: " + leftPage.width)
            }
        }

        Page {
            id: rightPage
            title: i18n.tr("Second column")

            Rectangle {
                anchors {
                    fill: parent
                    margins: units.gu(2)
                }
                color: UbuntuColors.green

                Button {
                    anchors.centerIn: parent
                    text: "Another page!"
                    onTriggered: layout.addPageToCurrentColumn(rightPage, sectionsPage)
                }
            }

            Component.onCompleted: {
                console.log("Initial rightPage size: " + rightPage.width + " " + rightPage.height)
            }

            onWidthChanged: {
                console.log("rightPage width changed: " + rightPage.width)
            }
        }

        Page {
            id: sectionsPage
            title: i18n.tr("Page with sections")
            head.sections.model: [i18n.tr("one"), i18n.tr("two"), i18n.tr("three")]

            Rectangle {
                anchors {
                    fill: parent
                    margins: units.gu(2)
                }
                color: UbuntuColors.blue
            }

            onWidthChanged: {
                console.log("sectionsPage width changed: " + sectionsPage.width)
            }
        }
    }
}

