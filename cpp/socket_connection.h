#ifndef SOCKET_CONNECTION_H
#define SOCKET_CONNECTION_H


#include <QObject>
#include <QDebug>
#include <QTcpSocket>
#include <QAbstractSocket>
#include <QString>



class Socket_connection : public QObject
{
    Q_OBJECT
public:
    explicit Socket_connection(QObject *parent = nullptr);

signals:


public slots:
    bool connect_to_host(QString HOST_ADDRESS, quint16 PORT_NUMBER);
    bool connected();
    bool disconnected();
    void bytesWritten(qint64 bytes);
    void readyRead();
    bool write_data(QString WriteData);

private:
    QTcpSocket *QTCPSocket;
};

#endif // SOCKET_CONNECTION_H
