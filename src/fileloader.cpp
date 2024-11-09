#include "fileloader.h"

FileLoader::FileLoader(QObject *parent)
    : QObject{parent}
{
    m_homePath = QStandardPaths::writableLocation(QStandardPaths::HomeLocation);
}

bool FileLoader::openFile(QUrl filePath)
{
    QFile file(filePath.toLocalFile());
    if(!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        return false;
    }
    QTextStream in (&file);
    m_openedFileContent = in.readAll();
    file.close();
    return true;
}

QString FileLoader::getHomePath()
{
    return "file:/"+ m_homePath;
}

QString FileLoader::getFileContent()
{
    return m_openedFileContent;
}
