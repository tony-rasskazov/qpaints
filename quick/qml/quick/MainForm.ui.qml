import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    id: item1
    width: 1024
    height: 520

    property alias button3: button3
    property alias button2: button2
    property alias button1: button1

    //property alias labelA: labelA
    //property alias labelA1: labelA1
    //property alias labelB: labelB
    //property alias labelC: labelC
    //property alias labelD: labelD
    //property alias labelE: labelE

    //property alias sliderA: sliderA
    //property alias sliderA1: sliderA1
    //property alias sliderB: sliderB
    //property alias sliderC: sliderC
    //property alias sliderD: sliderD
    //property alias sliderE: sliderE
    property alias hierarchyList: hierarchyList
    //property alias paramsLayout: paramsLayout
    //property alias canvasGrid: canvasGrid
    //property alias canvasItem: canvasItem

    //property alias columnDelegate: columnDelegate

    RowLayout {
        height: 26
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 359
        anchors.top: parent.top
        anchors.topMargin: 0

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
        id: listRect
        x: 0
        width: 359
        color: "#ffffff"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        z: -3

        ListView {
            id: hierarchyList
            anchors.fill: parent

            model: ListModel {
                ListElement {
                    name: "Grey"
                    colorCode: "grey"
                }

                ListElement {
                    name: "Red"
                    colorCode: "red"
                }

                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
            }

            /*
            delegate: Item {
                x: 5
                width: 200
                height: 20
                Row {

                    Text{
                        width: 20
                        height: 20
                        text: modelData.hasChild? modelData.isOpen ? "-" : "+" : ""
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        MouseArea{
                            anchors.fill: parent
                            onClicked: modelData.isOpen = !modelData.isOpen;
                        }
                    }
                    Column{
                        Text{ text: modelData.content }
                    }
                }
            }
            */
        }
        ScrollBar {
            flickable: hierarchyList;
        }
    }

    Rectangle {
        id: rectangle1
        color: "#b3ffffff"
        radius: 2
        border.color: "#000000"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 359
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 32
    }
}
