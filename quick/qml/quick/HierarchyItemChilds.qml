import QtQuick 2.4

Column{
    height: 50;
    width: 600;

    property alias model: list.model
    property alias delegate: list.delegate

    Repeater{
        id: list
        model:  modelData.childItems
        delegate: HierarchyItem {}
    }
}

