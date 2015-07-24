import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    //title: qsTr("Hello Tony")
    width: 640
    height: 480
    visible: true

    /*
    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    */
    Canvas {
        id: canvas
        anchors.fill: parent
        z: -1
        onPaint: {
            var ctx = getContext("2d");
            var w = canvas.width;
            var h = canvas.height;

            ctx.fillStyle = '#ff00ff';
            ctx.strokeStyle = '#0000ff';
            ctx.lineWidth = 1;

            ctx.strokeRect(10, 10, w - 20, h - 20);
            ctx.fillRect(10, 10, w - 20, h - 20);

            //var p = ctx.roundedRect(10, 10, w - 20, h - 20, 2, 2);
            //fill();
        }
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }

    MainForm {
        anchors.fill: parent
        button1.onClicked: messageDialog.show(qsTr("Button 1 pressed"))
        button2.onClicked: messageDialog.show(qsTr("Button 2 pressed"))
        button3.onClicked: messageDialog.show(qsTr("Button 3 pressed"))
        labelA.text: sliderA.value.toFixed(2)
        labelA1.text: sliderA1.value.toFixed(2)
        hierarchyList.model: programmModel.tree


        hierarchyList.delegate: Row {
            Text{
                width: 20
                height: 20
                text: modelData.hasChild? modelData.isOpen ? "2-" : "2+" : "2 "
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: modelData.isOpen = !modelData.isOpen;
                }
            }
            Rectangle {
                width: 20
                height: 20
                color: modelData.color
            }

            Column{
                Text{
                    text: modelData.content
                    verticalAlignment: Text.AlignVCenter
                    height: 20
                }
                Loader{
                    source: modelData.isOpen ? "TreeItemsList.qml" : "Empty.qml"
                }
            }
        }

    }
}


/*
var ctx = getContext("2d");
var w = canvas.width;
var h = canvas.height;
var delta = 5; // Spacing between lines
var phase = 1;
var x1 = 0;
var y1 = 0;
var x2 = w;
var y2 = 0;


while (true) {
    ctx.moveTo(x1, y1);
    ctx.lineTo(x2, y2);
    ctx.stroke();

    switch (phase) {
    case 1:
        x1 += delta; y2 += delta;
        if (x1 >= w || y2 >= h) {
            x1 = w; y2 = h;
            phase = 2;
        }
        break;
    case 2:
        y1 += delta; x2 -= delta;
        if (y1 >= w || x2 <= 0) {
            y1 = h; x2 = 0;
            phase = 3;
        }
        break;
    case 3:
        x1 -= delta; y2 -= delta;
        if (x1 <= 0 || y2 <= 0) {
            x1 = 0; x2 = 0;
            phase = 4;
        }
        break;
    case 4:
        y1 -= delta; x2 += delta;
        if (y1 <= 0 || x2 >= w) {
            y1 = 0; x2 = w;
            phase = 5;
        }
        break;
    case 5:
        return;
}
}
*/
