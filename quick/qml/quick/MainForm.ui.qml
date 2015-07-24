import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    id: item1
    width: 1024
    height: 768

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
    property alias hierarchyList: hierarchyList
    property alias paramsLayout: paramsLayout
    //property alias canvasGrid: canvasGrid
    //property alias canvasItem: canvasItem

    //property alias columnDelegate: columnDelegate

    RowLayout {
        x: 389
        y: 92
        width: 399
        height: 26

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
        rotation: 0
        anchors.top: parent.top
        anchors.topMargin: 267
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 45
        anchors.left: parent.left
        anchors.leftMargin: 327
        anchors.right: parent.right
        anchors.rightMargin: 89

        ColumnLayout {
            id: paramsLayout
            anchors.rightMargin: 13
            anchors.bottomMargin: 0
            anchors.leftMargin: -19
            anchors.topMargin: 0
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

    ToolButton {
        id: toolButton1
        x: 453
        y: 154
        width: 248
        height: 43
    }

    ListView {
        id: listView1
        x: 522
        y: 320
        width: 110
        height: 160
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
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
        delegate: Item {
            /*
            x: 5
            width: 200
            height: 20
            Row {
                id: itemDelegate
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
                    //Loader{
                    //    source: modelData.isOpen ? "TreeItemsList.qml" : "Empty.qml"
                    //}
                }
            }
            */
            /*
            x: 5
            width: 80
            height: 40
            Row {
                id: row2
                spacing: 10
                Rectangle {
                    width: 40
                    height: 40
                    color: modelData.color
                }

                Text {
                    text: modelData.contents
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            */
        }
    }

    Rectangle {
        id: listRect
        x: 0
        width: 297
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

    TreeItemsList {
        id: treeItemsList1
        x: 344
        y: 211
        width: 160
        height: 225
    }
}
