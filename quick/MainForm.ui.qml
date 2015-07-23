import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    id: item1
    width: 640
    height: 480

    property alias button3: button3
    property alias button2: button2
    property alias button1: button1

    property alias labelA: labelA
    property alias labelA1: labelA1
    //property alias labelB: labelB
    //property alias labelC: labelC
    //property alias labelD: labelD
    //property alias labelE: labelE

    property alias sliderA: sliderA
    property alias sliderA1: sliderA1
    //property alias sliderB: sliderB
    //property alias sliderC: sliderC
    //property alias sliderD: sliderD
    //property alias sliderE: sliderE

    property alias paramsLayout: paramsLayout
    //property alias canvasGrid: canvasGrid
    //property alias canvasItem: canvasItem

    RowLayout {
        x: 150
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Button {
            id: button1
            text: qsTr("Press Me 1")
        }

        Button {
            id: button2
            text: qsTr("Press Me 2")
        }

        Button {
            id: button3
            text: qsTr("Press Me 3")
        }

        Button {
            id: button4
            text: qsTr("Button")
        }
    }

    Rectangle {
        id: rectangle1
        color: "#99000000"
        radius: 5
        anchors.top: parent.top
        anchors.topMargin: 259
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 90
        anchors.left: parent.left
        anchors.leftMargin: 196
        anchors.right: parent.right
        anchors.rightMargin: 196

        ColumnLayout {
            id: paramsLayout
            anchors.fill: parent

            RowLayout {
                id: rowLayoutA
                height: 100
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 0

                Label {
                    id: labelA
                    text: sliderA.value
                    opacity: 0.9
                }

                Slider {
                    id: sliderA
                    anchors.left: parent.left
                    anchors.leftMargin: 28
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                }
            }

            RowLayout {
                id: rowLayoutA1
                height: 100
                Label {
                    id: labelA1
                    text: sliderA1.value
                    opacity: 0.9
                }

                Slider {
                    id: sliderA1
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    anchors.left: parent.left
                    anchors.leftMargin: 28
                }
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 5
            }
        }
    }
}
