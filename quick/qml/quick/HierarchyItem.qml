import QtQuick 2.4

Row {
    id: rectangle1
    width: 200
    height: 200

    Column{
        Text{ text: modelData.content }
        Loader{
            source: modelData.hasChild ? "HierarchyList.qml" : "Empty.ui.qml"
        }
    }

}

