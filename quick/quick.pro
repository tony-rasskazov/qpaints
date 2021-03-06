#TEMPLATE = app

CONFIG += c++11

folder_01.source = qml/quick
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

#QT += qml quick widgets

SOURCES += main.cpp \
    model.cpp \
    treeitem.cpp

#RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
#include(deployment.pri)

include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

#DISTFILES += \
#    Empty.qml \
#    TreeItemsList.qml \
#    ItemView.qml
#    main.qml

HEADERS += \
    model.h \
    treeitem.h

DISTFILES += \
    qml/quick/main.qml \
    qml/quick/TreeItemsList.qml \
    qml/quick/ItemView.qml \
    qml/quick/Empty.qml \
    qml/quick/MainForm.ui.qml \
    qml/quick/ScrollBar.qml
