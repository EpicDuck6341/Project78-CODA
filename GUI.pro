QT += quick
QT += core gui sql


SOURCES += \
        main.cpp \
        someclass.cpp

resources.files = main.qml Login.qml Dashboard.qml blue.jpg settings.png user.png graph.png logs.png command.png dashboard.png xdd.png exit.png SideBar.qml Settings.qml Commands.qml Graphs.qml User.qml Logs.qml
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
    Commands.qml \
    Dashboard.qml \
    Graphs.qml \
    Login.qml \
    Logs.qml \
    Settings.qml \
    SideBar.qml \
    User.qml


