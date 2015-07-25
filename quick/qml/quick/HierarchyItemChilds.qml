import QtQuick 2.0

Column{
    height: 20;
    width: 600;

    property alias model: list.model

    Repeater{
        id: list
        model:  model
        //model: programmModel.tree

        height: 20;
        width: 600;

        delegate: HierarchyItemChild {}
    }
}

