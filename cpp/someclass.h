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
    QString componentArray[7] = {"#FEFEFA","#ECEFF1",".png","#B0BEC5","#3B3B3B","#B0BEC5", "#d6d6d6"};
    std::vector<QString> commands;
    std::vector<QString> commandData;
    std::vector<bool> buttonState;
    bool loaderState =  false; //buttonLoader state on Command Page
    QString barLevel = 0;



signals:

public slots:    
    void setCurrentUser(QString user){
        currentUser = user;
    }
    QString getCurrentUser(){
        return currentUser;
    }
    void setButtonState(bool state,int index){
        buttonState[index] =  state;
    }
    bool getButtonState(int index){
        return buttonState[index];
    }

    int commandVecSize(){
        int size = commands.size();
        return size;
    }

    void setLoaderState(bool state){
        loaderState = state;
    }

    bool getLoaderState(){
        return loaderState;
    }

    void setBarLevel(QString level){
        barLevel = level;
    }

    QString getBarLevel(){
        return barLevel;
    }




    void connectDB();
    bool getUserLogin(QString username,QString password);
    void logUserAction(QString user,QString action);
    std::vector<QString> findCommands(QString rocketName);
    std::vector<QString> findCommandData(QString rocketName);
    QString getCommandName(int index);
    QString getCommandData(int index);
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
