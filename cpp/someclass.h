#ifndef SOMECLASS_H
#define SOMECLASS_H

#include <QObject>
#include <QtSql>
#include <QSqlDatabase>
#include <QSQLQuery>


class SomeClass : public QObject
{
    Q_OBJECT
public:
    QString currentUser;
    explicit SomeClass(QObject *parent = nullptr);
    QString componentArray[3] = {"#3b3a4a","#161626","White.png"};
    bool buttonState = false;  //Delaybutton state for page switching


signals:

public slots:    
    void setCurrentUser(QString user){
        currentUser = user;
    }
    QString getCurrentUser(){
        return currentUser;
    }
    void setButtonState(bool state){
        buttonState =  state;
    }
    bool getButtonState(){
        return buttonState;
    }
    void connectDB();
    bool getUserLogin(QString username,QString password);
    void logUserAction(QString user,QString action);
    std::vector<QString> findCommands(QString rocketName);
    void setColourComponent(int index, QString value){
        componentArray[index] = value;
    }
    QString getPath(QString path){
        QString endPath = componentArray[2];
        return path+endPath;
    }
    QString getColourComponent(int index){
        QString component = componentArray[index];
        return component;
    }
};

#endif // SOMECLASS_H
