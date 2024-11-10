#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include "src/fileloader.h"
#include "src/ipcinterface.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    FileLoader fileLoader;
    IpcInterface ipcInterface;
    engine.rootContext()->setContextProperty("fileLoader", &fileLoader);
    engine.rootContext()->setContextProperty("ipcInterface", &ipcInterface);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
