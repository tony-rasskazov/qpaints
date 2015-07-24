import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    //title: qsTr("Hello Tony")
    width: 1024
    height: 520
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

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }



    MainForm {
        Canvas {
            id: canvas
            anchors.fill: parent.hierarchyRect
            //z: -1
            onPaint: {

                function drawLeaf(leaf, x, y) {
                    ctx.beginPath();
                    ctx.font = "18px sans-serif";
                    var text = leaf.content;
                    var metrics = ctx.measureText(text);
                    ctx.strokeStyle = leaf.color;
                    ctx.text(text, x, y);
                    ctx.stroke();

                }

                function drawPlant(plant, x, y) {

                    ctx.fillRect(tlX, tlY, cW, cH);

                    ctx.strokeStyle = plant.color;
                    ctx.strokeRect(tlX, tlY, cW, cH);

                    if (plant.childCount > 0) {
                        drawLeaf(plant, x, y);
                        for (var k = 0; k < plant.childCount; ++k) {
                            if (plant.childItems[k].isOpen) {
                                tlY += 18;
                                tlX += 18;
                                drawPlant(plant.childItems[k], x + 10, y + offsetY);
                                //drawLeaf(plant, x, y);
                            }
                        }
                    } else {
                        //tlY += 18;

                        drawLeaf(plant, x, y);
                    }

                }

                var ctx = getContext("2d");
                var w = canvas.width;
                var h = canvas.height;
                var offsetX = 10;
                var offsetY = 10;

                var model = programmModel.tree;

                ctx.fillStyle = 'rgba(0, 0, 0, 0.2)';
                ctx.lineWidth = 1;

                h = h / programmModel.count;

                for (var i = 0; i < programmModel.count; ++i) {
                    var tlX  = offsetX;
                    var tlY  = offsetY + i * h;
                    var cW = w - offsetX * 2;
                    var cH = h - offsetY + i * h;

                    var x = tlX + 5;
                    var y = tlY + 20;

                    ctx.font = "20px sans-serif";
                    var text = programmModel.tree[i].content;
                    var metrics = ctx.measureText(text);

                    var plant = programmModel.tree[i];

                    drawPlant(plant, x, y);

                }
            }
        }

        anchors.fill: parent

        button1.onClicked: messageDialog.show(qsTr("Button 1 pressed"))
        button2.onClicked: messageDialog.show(qsTr("Button 2 pressed"))
        button3.onClicked: messageDialog.show(qsTr("Button 3 pressed"))

        hierarchyList.model: programmModel.tree
        hierarchyList.focus: true
        hierarchyList.highlightFollowsCurrentItem: true

        hierarchyList.highlight: Rectangle {
            border.color: "blue"
            radius: 2
        }

        hierarchyList.delegate: Row {

            Rectangle {
                width: 20
                height: 20
                border.color: modelData.color
                radius: 2

                Text {
                    anchors.fill: parent
                    text: modelData.hasChild? modelData.isOpen ? "-" : "+" : ""
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    MouseArea{
                        anchors.fill: parent
                        onClicked: modelData.isOpen = !modelData.isOpen;
                    }
                }
            }
            /*
            Text {
                height: 20
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: " " + modelData.level + " "
            }
            */
            Column {
                Text {
                    text: modelData.content
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    height: 20
                }
                Loader {
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
