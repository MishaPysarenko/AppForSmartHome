#ifndef SMS_CONNECTING_H
#define SMS_CONNECTING_H

#include <QObject>
#include <QQmlEngine>
#include <QString>

class sms_connecting : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:

    bool sendSMS(const QString &phoneNumber); // Оголошення функції тут
};


#endif // SMS_CONNECTING_H
