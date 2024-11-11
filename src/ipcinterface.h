#ifndef IPCINTERFACE_H
#define IPCINTERFACE_H

#include <QObject>
#include <QtDBus/QtDBus>

class IpcInterface : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList messages READ messages NOTIFY onMessageReceived)
public:
    IpcInterface(QObject *parent = nullptr);
    Q_INVOKABLE bool sendMessage(QString topic, QString message);
    Q_INVOKABLE void openDBusTopic(QString topic);
    QStringList messages() const;
public slots:
    void receiveMessage(const QString &message);
private:
    QDBusConnection m_bus = QDBusConnection::sessionBus();
    QString m_service = QString();
    QString m_interface = "org.techchallenge";
    QString m_path;
    QString m_name = "msg";
    QStringList m_messages;

signals:
    void onMessageReceived();
};

#endif // IPCINTERFACE_H
