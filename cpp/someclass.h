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
    bool actionLoaderSate = false;
    bool buttonLock = false;
    bool buttonSequence = true;
    double barLevel = 0;
    std::vector<std::vector<QString>> userActions;




signals:

public slots:

    void setButtonLock(bool state){
        buttonLock = state;
    }
    bool getButtonLock(){
        return buttonLock;
    }

    void setButtonSequence(bool state){
        buttonSequence = state;
    }

    bool getButtonSequence(){
        return buttonSequence;
    }

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

    int userActionSize(){
        int size = userActions.size();
        return size;
    }

    QString getUserAction(int x, int y){
        QString var = userActions[x][y];
        return var;
    }


    void setLoaderState(bool state){
        loaderState = state;
    }

    bool getLoaderState(){
        return loaderState;
    }

    void setActionLoaderState(bool state){
        actionLoaderSate = state;
    }

    bool getActionLoaderState(){
        return actionLoaderSate;
    }

    void setBarLevel(double level){
        barLevel = level;
    }

    double getBarLevel(){
        return barLevel;
    }

    std::vector<std::vector<QString>> findUserAction(QString username);




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
