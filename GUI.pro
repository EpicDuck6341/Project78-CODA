QT += quick
QT += core gui sql


SOURCES += \
        main.cpp \
        someclass.cpp

resources.files = main.qml LoginPage.qml MainMenu.qml blue.jpg settings.png user.png graph.png logs.png command.png dashboard.png xdd.png exit.png SideBar.qml
resources.prefix = /$${TARGET}
RESOURCES += resources

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    someclass.h

DISTFILES += \
    LoginPage.qml \
    MainMenu.qml \
    SideBar.qml

