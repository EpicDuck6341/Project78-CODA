# Project 7/8: CODA Missile Launch
Authors (studentnumbers): 
- Elijah Kaijser (1022177)

Last edited on: 2023-06-24



---

## 1. Downloading and running the project 

Download the latest version of the project from [GitHub](https://github.com/EpicDuck6341/Project78-CODA)

Download and install the latest version of [Qt](https://www.qt.io/download)

Also make sure to install [SQLite](https://www.sqlite.org/index.html).

It is also highly recommended to download [SQLite Studio](https://sqlitestudio.pl/)

### 1.1 Qt installation

During the Qt installation make sure to select the "QT 6.3 for desktop development" option at the install folder page.
For visual reference navigate to step two from this [guide](https://web.stanford.edu/dept/cs_edu/resources/qt/install-windows)

#### 1.2 Run the project

1. Unzip the the GitHub project.
2. Open Qt Creator and select the file option in the top left corner.
3. Select the third option "Open File or Project...".
4. Navigate to the unzipped project folder.
5. Select the GUI.pro file and open the project.
6. To run the project simply press the green play button in the lower left corner.

---

## 2. Contributing

This is a project created in Qt Creator and written in QML with a C++ backend. Some knowledge of QML is recommended.

#### C++
The C++ class SomeClass.cpp hase been used for connecting to the SQLite database and storing variables and data.

The backend makes use of SQL queries to get/insert data from/into the database. The retrieved data gets stored into a vector. This way it can be called upon in the QML code. 

Everytime a Qt page gets openend it resets to the original state of creation. To combat this I store all the important data in my C++ classes, for example I store color and the state of certain elements if they should be visible or not.

To connect the C++ backend with QML you simply need to create an object of the preffered class in main.cpp.
Afterwhich you need to add these lines of code

QQmlContext * rootContext = engine.rootContext();
rootContext->setContextProperty("qmlClassName",&nameOfObject);

Simply replace qmlClassName with the name you want to use to call upon your class from QML. To then use that class in QML you need to call upon your class and put the function that you want to use after. It should look like this

qmlClassName.function()

This way you can call C++ functions in QML that work the exact same way as they would in the backend.

#### QML
Almost all QML classes are their own pages. The exceptions are the main class which gets used to start the programm onf the login page and the SideBar class which gets used as an asset in other pages.

The switchpage function, found in login.qml, is used to switch pages. Simply give the full path to the page you want to switch to into the funtion parameter. It is therefore recommended to put all the QML pages into their own folder so only the name needs to be used as path.

All pages mainly consist of visual aspects and function which have comments to explain them, except for the commands page which is a bit more convoluted. Therefore it will be explained in more detail here.

The command page makes use of a grid and a repeater to create the buttons needed for the launch sequence. The repeater makes use of a vector that has been fileld with data from the database. It checks the size of the vector and creates the correct ammount of buttons needed. These  buttons can only be activated after the lock commands option has been selected, the lockCommands() function checks if this is the case. If the option has been selected the buttons can only be pressed in order, so first 1 then 2 then 3 etc. This can be turned of by selecting the lock sequence option, this is checked by the lockSequence() function. The army of if statements in this class have been made if the option has not been selected.
These statements check if the previous button has been turned on, if that is the case the next button can be activated.
It then sets the state to active and stores it in a vector that is kept in the backend. It also does this the other way around for deactivating by checking the button after it. For example if the user wants to deactivate button 8 it checks if the state of button 9 is off and vice versa for activating. Because the first button doesnt have one before and the last button doesnt have one after special checks have been implemented. If the user want to switch one the first button it doesnt check for the button before it, this work the same for deactivating the last button by not checking for a button after it.

#### Database

To adjust the database simply launch SQLite Studio and import the database. This is done by selecting the Database option in the top left corner and clicking add database. Then navigate to the folder of the project and select the database.db file.
Now by double clicking the new entry you establish a connection and can freely adjust the database.
The structure of the databse can be viewed in the pdf included in the project.




---


## 3. Recommendations

The currents version of the GUI still needs to be improved, so below are recommendations that have been made by the Product Owners and myself to further expand on the interface.

#### Dashboard
- The user should be able to remove users and rockets from the database while at the dashboard.
#### Commands 
- The search bar should provide the user with a list of rocket after an incorrect rocket has been searched. Alternatively a list could be provided before hand in which a user only needs to select the rocket. 
- The buttons currently have an off and on state, because the button sends data once after it has been clicked the off state has no use.So, the button should be returned to the off state a little while after it has been turned on.
- Display important data from the rocket so that the user doesnt need to swap between pages.
#### Logs
- Provied the user to search for rockets instead of only users.
- Tidy up the display for logs so that they always fit into their own columns.

#### Graphs
- Implement graphs or other visual aspects to display all the data from the rocket.

