#include <QtGui/QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "qtquick2applicationviewer.h"

#include "model.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Model m;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("programmModel", &m);


    engine.load(QUrl(QStringLiteral("../Resources/qml/quick/main.qml")));
    //QObject *topLevel = engine.rootObjects().value(0);
    //QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);

    //window->show();
    return app.exec();

}
