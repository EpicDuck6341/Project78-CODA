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
    QString componentArray[7] = {"#FEFEFA","#ECEFF1",".png","#B0BEC5","#3B3B3B","#B0BEC5", "#d6d6d6"};//This contains all starting colors + matching icons in the 3rd element
    std::vector<QString> commands; //Vector in which the command names get put after beinmg requested on the Commands.qml page
    std::vector<QString> commandData;//Vector which matches the command names from the vector above
    std::vector<bool> buttonState; //Button state which remembers per button if it should be switched on or off if a users click away and back onto the page
    bool loaderState =  false; //ButtonLoader state on Command Page
    bool actionLoaderSate = false; //Loader on Logs page
    bool buttonLock = false; //Remembers if the users locked in the buttons
    bool buttonSequence = true;//Remembers the preferred button sequence from the user
    double barLevel = 0; //Sets the bar level to reset if a new rocket is searched
    std::vector<std::vector<QString>> userActions; //2d vector of all user actions
    bool searchBarVisible = true; //Set search bar in the command page invisible if the buttons have been locked in




signals:

public slots:

    void setSearchBarVisible(bool var){
        searchBarVisible = var;
    }
    bool getSearchBarVisible(){
        return searchBarVisible;
    }

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
        return size; //return the size of the vector for the repeater on commands page
    }

    int userActionSize(){
        int size = userActions.size();
        return size; //return the size of the vector for the repeeater on logs page
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

    void setColourComponent(int index, QString value){//Change the hex values of the vector to new preffered colors
        componentArray[index] = value;
    }
    QString getPath(QString path){//Function used to return the path to the icons used in the GUI. Icon colors should swap according to the set color mode
        QString endPath = componentArray[2];
        return path+endPath;
    }
    QString getColourComponent(int index){ //Function used the return the color hex code used in the pages
        QString component = componentArray[index];
        return component;
    }

    std::vector<std::vector<QString>> findUserAction(QString username);//Database query function to find user action by username
    bool getUserLogin(QString username,QString password);//Database query function to check if input users matches tom database
    void logUserAction(QString user,QString action);//Database query function to log what a user has done
    void addNewUser(QString newUser,QString newPassword);//Database query function for addinng new user
    void addNewRocket(QString rocketName, QString commandName, QString commandData);//Database query function for adding new rocket
    std::vector<QString> findCommands(QString rocketName);//Database query function for finding command nameas that match the rocket names, return vector with the commands
    std::vector<QString> findCommandData(QString rocketName);//Database query function for finding command data that match rocket names, return vector with data
    QString getCommandName(int index); //Gets element from the commandname vector
    QString getCommandData(int index); //Gets element from the commandData vector
    QSqlDatabase openDatabase();//Function for opening the databse that gets used in all the query functions

};

#endif // SOMECLASS_H
