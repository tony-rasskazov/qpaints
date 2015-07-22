import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("Hello Tony")
    width: 640
    height: 480
    visible: true

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

    MainForm {
        anchors.fill: parent
        button1.onClicked: messageDialog.show(qsTr("Button 1 pressed"))
        button2.onClicked: messageDialog.show(qsTr("Button 2 pressed"))
        button3.onClicked: messageDialog.show(qsTr("Button 3 pressed"))
        labelA.text: sliderA.value.toFixed(2)
        labelB.text: sliderB.value.toFixed(2)
        labelC.text: sliderC.value.toFixed(2)
        labelD.text: sliderD.value.toFixed(2)
        labelE.text: sliderE.value.toFixed(2)
    }

    Canvas {
      id:canvas
      width: 640
      height: 480
      onPaint: {
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
}
