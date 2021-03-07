#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlEngine>
#include <QQmlContext>
#include <QSize>
#include <QScreen>
#include <QDebug>
#include "qsplineseries.h"
#include "qchartview.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    qputenv("QT_QPA_PLATFORM", "webgl:port=8998");
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QSize screenSize = QApplication::primaryScreen()->size();

    engine.rootContext()->setContextProperty("applicationDirPath", QApplication::applicationDirPath());
    engine.rootContext()->setContextProperty("screenWidth", screenSize.width() > screenSize.height() ? screenSize.width() : screenSize.height());
    engine.rootContext()->setContextProperty("screenHight", (screenSize.width() > screenSize.height() ? screenSize.height() : screenSize.width())*0.92);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
