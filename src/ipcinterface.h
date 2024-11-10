#ifndef IPCINTERFACE_H
#define IPCINTERFACE_H

#include <QObject>
#include <QtDBus/QtDBus>

#define SERVICE_NAME "org.example.QtDBus.PingExample"

class IpcInterface : public QObject
{
    Q_OBJECT
public:
    IpcInterface(QObject *parent = nullptr);
    Q_INVOKABLE bool sendMessage(QString topic, QString message);
    Q_INVOKABLE void openDBusTopic(QString topic);
public slots:
    void receiveMessage(QString message);
};

#endif // IPCINTERFACE_H
