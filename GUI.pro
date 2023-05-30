QT += quick
QT += core gui sql


SOURCES += \
        cpp/main.cpp \
        cpp/someclass.cpp \
        cpp/socket_connection.cpp

resources.files = qml/main.qml qml/Login.qml qml/Dashboard.qml assets/settings.png assets/user.png assets/graph.png assets/logs.png assets/command.png assets/dashboard.png assets/exit.png qml/SideBar.qml qml/Settings.qml qml/Commands.qml qml/Graphs.qml  qml/Logs.qml assets/Logo.png assets/exitWhite.png assets/commandWhite.png assets/dashboardWhite.png assets/graphWhite.png assets/LogoWhite.png assets/logsWhite.png assets/settingsWhite.png assets/userWhite.png assets/background.png assets/backgroundWhite.png
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
    cpp/someclass.h \
    cpp/socket_connection.h

DISTFILES += \
    qml/Commands.qml \
    qml/Dashboard.qml \
    qml/Graphs.qml \
    qml/Login.qml \
    qml/Logs.qml \
    qml/Settings.qml \
    qml/SideBar.qml


