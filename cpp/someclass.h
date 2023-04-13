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
    QString componentArray[6] = {"#FEFEFA","#ECEFF1",".png","#B0BEC5","#3B3B3B","#B0BEC5"};
    std::vector<QString> commands;
    bool buttonState[5] = {false,false,false,false,false};  //Delaybutton state for page switching
    int currentIndex;//Combobox index


signals:

public slots:    
    void setCurrentIndex(int index){
        currentIndex = index;
    }
    int getCurrentIndex(){
        return currentIndex;
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

    void connectDB();
    bool getUserLogin(QString username,QString password);
    void logUserAction(QString user,QString action);
    std::vector<QString> findCommands(QString rocketName);
    QString getCommandName(int index);
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
