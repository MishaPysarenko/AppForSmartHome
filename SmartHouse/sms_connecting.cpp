#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QUrlQuery>
#include <QAuthenticator>
#include <QNetworkReply>
#include "sms_connecting.h"


bool sms_connecting::sendSMS(const QString &phoneNumber)
{
    QNetworkAccessManager manager;
    QUrl url("https://www.snp.kiev.ua/SmartHouse.php?pasword=12345&who=client&request=qwerty&Arguments=123456");

    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");

    QUrlQuery params;
    params.addQueryItem("To", phoneNumber);
    params.addQueryItem("From", "+ВашНомерTwilio");
    params.addQueryItem("Body", "Підключення smart house успішне");

    QObject::connect(&manager, &QNetworkAccessManager::authenticationRequired,
                     [&](QNetworkReply*, QAuthenticator* authenticator) {
                         authenticator->setUser("Ваш_account_sid");
                         authenticator->setPassword("Ваш_auth_token");
                     });

    QNetworkReply* reply = manager.post(request, params.query().toUtf8());

    QObject::connect(reply, &QNetworkReply::finished, [=]() {
        if (reply->error() == QNetworkReply::NoError) {
            qDebug() << "Відправка успішна";
        } else {
            qDebug() << "Помилка при відправці:" << reply->errorString();
        }
    });


    return true; // цей метод тепер асинхронний, тому повертаємо true як підтвердження, що запит було створено
}
