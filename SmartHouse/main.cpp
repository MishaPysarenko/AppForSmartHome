#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "sms_connecting.h" // Підключення вашого заголовочного файла

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    // Реєстрація вашого C++ класу у QML

    qmlRegisterType<sms_connecting>("com.yourdomain", 1, 0, "SMSConnector");


    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/SmartHouse/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
