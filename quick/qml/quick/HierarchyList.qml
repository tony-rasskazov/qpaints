import QtQuick 2.4

/*
Rectangle {
    width: 100
    height: 62
}

*/

Column{
    height: 20;
    width: 600;

    Repeater{
//        model:  modelData.childItems
        model: programmModel.tree

        height: 20;
        width: 600;

        delegate: HierarchyItem {}
    }
}

