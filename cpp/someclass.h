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
    explicit SomeClass(QObject *parent = nullptr);
    QString componentArray[3] = {"#3b3a4a","#161626","White.png"};


signals:

public slots:    
    void connectDB();
    bool getUserLogin(QString username,QString password);
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
