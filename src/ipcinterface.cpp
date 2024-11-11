#include "ipcinterface.h"

IpcInterface::IpcInterface(QObject *parent) : QObject{parent}
{
}

bool IpcInterface::sendMessage(QString topic, QString message)
{
    QDBusConnection bus = QDBusConnection::sessionBus();
    QDBusMessage m_message = QDBusMessage::createTargetedSignal(m_service, topic, m_interface, m_name);
    m_message << message;
    if (bus.send(m_message)) {
    } else {
        qWarning() << "Falha ao enviar a mensagem!";
    }
    return true;
}

void IpcInterface::receiveMessage(const QString &message)
{
    m_messages.prepend(message);
    emit onMessageReceived();
}

QStringList IpcInterface::messages() const {
    return m_messages;
}

void IpcInterface::openDBusTopic(QString topic)
{
    if(m_path == "/") {
        m_bus = QDBusConnection::sessionBus();
    }
    if(!m_path.isEmpty()) {
        m_bus.disconnect(m_service, m_path, m_interface, m_name, this, SLOT(receiveMessage(QString)));
        m_path.clear();
    }
    m_path = topic;
    if (!m_bus.connect(m_service, m_path, m_interface, m_name, this, SLOT(receiveMessage(QString)))) {
        qWarning() << "Failed to connect to targeted signal!";
        return;
    }
}

