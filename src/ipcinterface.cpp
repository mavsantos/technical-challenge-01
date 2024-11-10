#include "ipcinterface.h"

IpcInterface::IpcInterface(QObject *parent) : QObject{parent}
{
}

bool IpcInterface::sendMessage(QString topic, QString message)
{
    QDBusConnection bus = QDBusConnection::sessionBus();
    QDBusMessage m_message = QDBusMessage::createSignal(topic, "org.techchallenge", "msg");
    m_message << message;
    if (bus.send(m_message)) {
        qDebug() << "Mensagem enviada!";
    } else {
        qWarning() << "Falha ao enviar a mensagem!";
    }
    return true;
}

void IpcInterface::receiveMessage(QString message)
{
    qDebug() << "Mensagem recebida:" << message;
}

void IpcInterface::openDBusTopic(QString topic)
{
    QDBusConnection bus = QDBusConnection::sessionBus();
    bus.connect(QString(), topic, "org.techchallenge", "msg", this, SLOT(onMessageReceived(QString)));
}

