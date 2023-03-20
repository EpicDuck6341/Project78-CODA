#include "someclass.h"
#include <iostream>
#include <QDebug>

const QDir projectPath = QDir::currentPath();
const QString Database_path = projectPath.absolutePath() + "/database.db";


SomeClass::SomeClass(QObject *parent)
    : QObject{parent}
{

}

bool SomeClass::getUserLogin(QString username, QString password)
{
    if(username == "" || password == ""){
        return false;
    }
    QSqlDatabase sqlitedb = QSqlDatabase::addDatabase("QSQLITE");
    sqlitedb.setDatabaseName(Database_path);

    if (!sqlitedb.open()) {
        qDebug() << "Error = " << sqlitedb.lastError().text();
        return false;
    }
    QString sQuery = "SELECT * FROM users WHERE username LIKE '%" + username + "%';";

    QSqlQuery qry(sQuery);

    if (qry.lastError().isValid()) {
        qDebug() << "Error = " << qry.lastError().text();
        sqlitedb.close();
        return false;
    }

    if (qry.next()) {
        QString usernameDB = qry.value(0).toString();
        QString passwordDB = qry.value(1).toString();
        if(username == usernameDB && password == passwordDB){
        sqlitedb.close();
        return true;
    }
       sqlitedb.close();
    }

    sqlitedb.close();
    return false;
}



void SomeClass::connectDB(){

    QSqlDatabase sqlitedb = QSqlDatabase::addDatabase("QSQLITE");
    sqlitedb.setDatabaseName(Database_path);

    if(!sqlitedb.open()){
        qDebug() << "Error = " << sqlitedb.lastError().text();
    }
    else{
        qDebug() << "Database is opened";

        QString send = "11110101101010101110000011110000101011111010101111111111";
        QString length = "11110101";
        QString packet = "10101010";
        QString destination = "11100000";
        QString source = "11110000";
        QString command = "10101111";
        QString data = "10101011";
        QString checksum = "11111111";
        QString time = "STRFTIME('%Y-%m-%d %H:%M:%f', 'now', 'localtime')";

        QString sQuery = "INSERT INTO communicatie_protocol (Send_data, Length_byte, Packet_byte, Destination_byte, Source_byte, Command_byte, Data_bytes, Checksum_byte, timestamp) VALUES (:Send_data, :Length_byte, :Packet_byte, :Destination_byte, :Source_byte, :Command_byte, :Data_bytes, :Checksum_byte, datetime('now','localtime'));";


        QSqlQuery qry;
        qry.prepare(sQuery);

        qry.bindValue(":Send_data", send);
        qry.bindValue(":Length_byte", length);
        qry.bindValue(":Packet_byte", packet);
        qry.bindValue(":Destination_byte", destination);
        qry.bindValue(":Source_byte", source);
        qry.bindValue(":Command_byte", command);
        qry.bindValue(":Data_bytes", data);
        qry.bindValue(":Checksum_byte", checksum);
        qry.bindValue(":Time", time);
        qry.exec();

        if(qry.exec()){
            qDebug() << "Record Inserted";
        }
        else{
            if((qry.lastError().isValid())){
                qDebug() << "Error = " << qry.lastError().text();
            }
        }
        qDebug() << "Closing..";
        sqlitedb.close();
    }
}






