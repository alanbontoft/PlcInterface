#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include <QCursor>
#include <QList>

#include "datamodel.h"
#include "datalist.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    // hide cursor for touch app
    QGuiApplication::setOverrideCursor(QCursor(Qt::BlankCursor));

    qmlRegisterUncreatableType<DataModel>("MyDataModels", 1, 0, "DataModel", "DataModel is uncreatable type");
    qmlRegisterUncreatableType<DataList>("MyDataModels", 1, 0, "DataList", "DataList is uncreatable type");

    // declare data model objects
    DataList dataList;

    dataList.setSize(4);


    QQmlApplicationEngine engine;

    // make data models visible to QML
    engine.rootContext()->setContextProperty("TheDataList", &dataList);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
