import QtQuick 2.0

Column{
    height: 20;
    width: 600;

    property alias model: list.model
    property alias delegate: list.delegate

    Repeater{
        id: list
        model:  modelData.childItems

        height: 20;
        width: 600;

        delegate: HierarchyItem {}
    }
}

