#include "socket_connection.h"

Socket_connection::Socket_connection(QObject *parent)
    : QObject{parent}
{

}

bool Socket_connection::connect_to_host(QString HOST_ADDRESS, quint16 PORT_NUMBER){
    QTCPSocket = new QTcpSocket(this);

    connect(QTCPSocket,SIGNAL(connected()), this, SLOT(connected()));
    connect(QTCPSocket,SIGNAL(disconnected()), this, SLOT(disconnected()));
    connect(QTCPSocket,SIGNAL(readyRead()), this, SLOT(readyRead()));

    //Deze regel doet soms raar maar kan handig zijn als er gezien kan worden hoeveel bytes worden verstuurd
//    connect(this, SIGNAL(bytesWritten(qint64)), this, SLOT(bytesWritten(qint64)));

    QTCPSocket->connectToHost(HOST_ADDRESS,PORT_NUMBER);

    if(!QTCPSocket->waitForConnected(500)){
        qDebug() << "Connection failed to host ip-adres: 192.168.178.173 with port number: 80";
        return false;
    }
    qDebug() << "Connected to host ip-adres: 192.168.178.173 with port number: 80";
    return true;
}

bool Socket_connection::connected(){
    return true;
}

bool Socket_connection::disconnected(){

    if(QTCPSocket->isOpen()){
        QTCPSocket->close();
        qDebug() << "Disconnected from host 192.168.178.173 with port number: 80";
        return true;
    }
    else{
        qDebug() << "There was no connection";
        return false;
    }
}

void Socket_connection::bytesWritten(qint64 bytes){
    qDebug() << bytes << " have been written to the host.";
}

void Socket_connection::readyRead(){
    qDebug() << "Reading...";
    qDebug() << "Received data " << QTCPSocket->readAll();
}

bool Socket_connection::write_data(QString WriteData){
    if(QTCPSocket){

        if(QTCPSocket-> isOpen()){
            QTCPSocket->write(WriteData.toStdString().c_str());
            qDebug() << "Message has been send";
            return true;
        }
        else{
            qDebug() << "Could not send message";
            return false;
        }
    }
    else{
        qDebug() << "Could not send message";
        return false;

    }
}
