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
    property alias labelB: labelB
    property alias labelC: labelC
    property alias labelD: labelD
    property alias labelE: labelE

    property alias sliderA: sliderA
    property alias sliderB: sliderB
    property alias sliderC: sliderC
    property alias sliderD: sliderD
    property alias sliderE: sliderE

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

    ColumnLayout {
        id: columnLayout1
        x: 197
        y: 299
        width: 248
        height: 131
        anchors.verticalCenterOffset: 85
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        RowLayout {
            id: rowLayout1
            width: 100
            height: 100

            Label {
                id: labelA
                text: sliderA.value
            }

            Slider {
                id: sliderA
            }
        }

        RowLayout {
            id: rowLayout2
            width: 100
            height: 100
            Label {
                id: labelB
                text: sliderB.value
            }

            Slider {
                id: sliderB
            }
        }

        RowLayout {
            id: rowLayout3
            width: 100
            height: 100
            Label {
                id: labelC
                text: sliderC.value
            }

            Slider {
                id: sliderC
            }
        }

        RowLayout {
            id: rowLayout4
            width: 100
            height: 100
            Label {
                id: labelD
                text: sliderD.value
            }

            Slider {
                id: sliderD
            }
        }

        RowLayout {
            id: rowLayout5
            width: 100
            height: 100
            Label {
                id: labelE
                text: "0"
            }

            Slider {
                id: sliderE
            }
        }
    }
}
