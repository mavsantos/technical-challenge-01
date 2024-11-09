#ifndef FILELOADER_H
#define FILELOADER_H

#include <QObject>
#include <QStandardPaths>
#include <QtCore>


class FileLoader : public QObject
{
    Q_OBJECT
public:
    explicit FileLoader(QObject *parent = nullptr);
    Q_INVOKABLE QString getHomePath();
    Q_INVOKABLE bool openFile(QUrl filePath);
    Q_INVOKABLE QString getFileContent();

private:
    QString m_homePath;
    QString m_openedFileContent;

signals:
};

#endif // FILELOADER_H
