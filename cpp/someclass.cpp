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

std::vector<QString> SomeClass::findCommands(QString rocketName) {
    commands.clear();
    buttonState.clear();
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(Database_path);

    if (!db.open()) {
        qDebug() << "Error: " << db.lastError().text();
       commands.clear();
       return {};
    }

    QString query = "SELECT command_name FROM commands WHERE launch_type = '" + rocketName + "';";


    QSqlQuery qry(query);

    if (qry.lastError().isValid()) {
        qDebug() << "Error: " << qry.lastError().text();
        db.close();
        commands.clear();
        return {};
    }

    while (qry.next()) {
        QString command = qry.value(0).toString();
        commands.push_back(command);
    }

    for(unsigned long long i = 0; i<commands.size();i++){
        buttonState.push_back(false);
    }

    db.close();
    return commands;
}

std::vector<QString> SomeClass::findCommandData(QString rocketName) {
    commandData.clear();
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(Database_path);

    if (!db.open()) {
        qDebug() << "Error: " << db.lastError().text();
       commandData.clear();
       return {};
    }

    QString query = "SELECT command FROM commands WHERE launch_type = '" + rocketName + "';";


    QSqlQuery qry(query);

    if (qry.lastError().isValid()) {
        qDebug() << "Error: " << qry.lastError().text();
        db.close();
        commandData.clear();
        return {};
    }

    while (qry.next()) {
        QString command = qry.value(0).toString();
        commandData.push_back(command);
    }

    db.close();
    return commandData;
}

QString SomeClass::getCommandName(int index){
    if(commands.empty() == true){
        return "error";
    }
    QString name = commands[index];
    return name;
}

QString SomeClass::getCommandData(int index){
    QString data = commandData[index];
    qDebug() << data;
    return data;
}





void SomeClass::logUserAction(QString user, QString userAction)
{
    QSqlDatabase sqlitedb = QSqlDatabase::addDatabase("QSQLITE");
    qDebug() << Database_path;
    sqlitedb.setDatabaseName(Database_path);

    if (!sqlitedb.open()) {
        qDebug() << "Error = " << sqlitedb.lastError().text();
    }
    else {
        qDebug() << "Database is opened";

        QString username = user;
        QString action = userAction;
        QDateTime timestamp = QDateTime::currentDateTime();

        QString sQuery = "INSERT INTO user_actions (username, action, timestamp) VALUES (:username, :action, :timestamp)";

        QSqlQuery qry;
        qry.prepare(sQuery);

        qry.bindValue(":username", username);
        qry.bindValue(":action", action);
        qry.bindValue(":timestamp", timestamp);
        qry.exec();

        if (qry.lastError().isValid()) {
            qDebug() << "Error = " << qry.lastError().text();
        }
        else {
            qDebug() << "Record Inserted";
        }

        qDebug() << "Closing..";
        sqlitedb.close();
    }
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






