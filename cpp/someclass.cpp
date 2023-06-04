#include "someclass.h"
#include <iostream>
#include <QDebug>

const QString Database_path = QDir::currentPath() + "/database.db";

SomeClass::SomeClass(QObject *parent)
    : QObject{parent}
{

}

QSqlDatabase SomeClass::openDatabase() {
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(Database_path);

    if (!db.open()) {
        qDebug() << "Error: " << db.lastError().text();
    }

    return db;
}

bool SomeClass::getUserLogin(QString username, QString password)
{
    if (username.isEmpty() || password.isEmpty()) {
        return false;
    }

    QSqlDatabase db = openDatabase();
    if (!db.isOpen()) {
        return false;
    }

    QString query = "SELECT * FROM users WHERE username LIKE '%" + username + "%';";
    QSqlQuery qry(query, db);

    if (qry.lastError().isValid()) {
        qDebug() << "Error = " << qry.lastError().text();
        db.close();
        return false;
    }

    if (qry.next()) {
        QString usernameDB = qry.value(0).toString();
        QString passwordDB = qry.value(1).toString();
        if (username == usernameDB && password == passwordDB) {
            db.close();
            return true;
        }
    }

    db.close();
    return false;
}

std::vector<QString> SomeClass::findCommands(QString rocketName) {
    commands.clear();
    buttonState.clear();

    QSqlDatabase db = openDatabase();
    if (!db.isOpen()) {
        commands.clear();
        return {};
    }

    QString query = "SELECT command_name FROM commands WHERE launch_type = '" + rocketName + "';";
    QSqlQuery qry(query, db);

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

    for (unsigned long long i = 0; i < commands.size(); i++) {
        buttonState.push_back(false);
    }

    db.close();
    return commands;
}

std::vector<QString> SomeClass::findCommandData(QString rocketName) {
    commandData.clear();
    QSqlDatabase db = openDatabase();
    if (!db.isOpen()) {
        commandData.clear();
        return {};
    }

    QString query = "SELECT command FROM commands WHERE launch_type = '" + rocketName + "';";
    QSqlQuery qry(query, db);

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

QString SomeClass::getCommandName(int index) {
    if (commands.empty()) {
        return "error";
    }
    QString name = commands[index];
    return name;
}

QString SomeClass::getCommandData(int index) {
    QString data = commandData[index];
    qDebug() << data;
    return data;
}

std::vector<std::vector<QString>> SomeClass::findUserAction(QString username) {
    userActions.clear();
    QSqlDatabase db = openDatabase();
    if (!db.isOpen()) {
        return userActions;
    }

    QString query = "SELECT id, username, action, timestamp FROM user_actions WHERE username = '" + username + "' ORDER BY timestamp DESC;";
    QSqlQuery qry(query, db);

    if (qry.lastError().isValid()) {
        qDebug() << "Error: " << qry.lastError().text();
        db.close();
        return userActions;
    }

    while (qry.next()) {
        std::vector<QString> row;
        QString id = qry.value(0).toString();
        QString username = qry.value(1).toString();
        QString action = qry.value(2).toString();
        QString timestamp = qry.value(3).toString();
        row.push_back(id);
        row.push_back(username);
        row.push_back(action);
        row.push_back(timestamp);
        userActions.push_back(row);
    }

    db.close();
    return userActions;
}

void SomeClass::logUserAction(QString user, QString userAction) {
    QSqlDatabase db = openDatabase();
    if (!db.isOpen()) {
        return;
    }

    QString username = user;
    QString action = userAction;
    QDateTime timestamp = QDateTime::currentDateTime();

    QString sQuery = "INSERT INTO user_actions (username, action, timestamp) VALUES (:username, :action, :timestamp)";

    QSqlQuery qry(db);
    qry.prepare(sQuery);
    qry.bindValue(":username", username);
    qry.bindValue(":action", action);
    qry.bindValue(":timestamp", timestamp);
    qry.exec();

    if (qry.lastError().isValid()) {
        qDebug() << "Error = " << qry.lastError().text();
    } else {
        qDebug() << "Record Inserted";
    }

    db.close();
}

void SomeClass::addNewUser(QString newUser, QString newPassword) {
    QSqlDatabase db = openDatabase();
    if (!db.isOpen()) {
        return;
    }

    QString username = newUser;
    QString password = newPassword;

    QString sQuery = "INSERT INTO users (username, password) VALUES (:username, :password)";

    QSqlQuery qry(db);
    qry.prepare(sQuery);
    qry.bindValue(":username", username);
    qry.bindValue(":password", password);
    qry.exec();

    if (qry.lastError().isValid()) {
        qDebug() << "Error = " << qry.lastError().text();
    } else {
        qDebug() << "Record Inserted";
    }

    db.close();
}

void SomeClass::addNewRocket(QString rocketName, QString commandName, QString commandData) {
    QSqlDatabase db = openDatabase();
    if (!db.isOpen()) {
        return;
    }

    QString rocketN = rocketName;
    QString commandN = commandName;
    QString commandD = commandData;

    QString sQuery = "INSERT INTO commands (launch_type, command_name, command) VALUES (:launch_type, :command_name, :command)";

    QSqlQuery qry(db);
    qry.prepare(sQuery);
    qry.bindValue(":launch_type", rocketN);
    qry.bindValue(":command_name", commandN);
    qry.bindValue(":command", commandD);
    qry.exec();

    if (qry.lastError().isValid()) {
        qDebug() << "Error = " << qry.lastError().text();
    } else {
        qDebug() << "Record Inserted";
    }

    db.close();
}


