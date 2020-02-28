#************  Qt Configurations  *****************************************************************
QT += qml quick quickcontrols2 svg xml
CONFIG += c++11 #qtquickcompiler
DEFINES += QT_DEPRECATED_WARNINGS
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000


#************  X 3rd Party Libs  ******************************************************************


#************  X Modules  *************************************************************************
include($$PWD/../../libraries/x_material_controls/x_material_controls.pri)
include($$PWD/../../libraries/x_storage/x_storage.pri)
include($$PWD/../../libraries/x_utils/x_utils.pri)
include($$PWD/../../libraries/x_worker/x_worker.pri)


#************  QML Configurations  ****************************************************************
QML_IMPORT_PATH += $$PWD/qml
QML_DESIGNER_IMPORT_PATH =


#************  App Sources  ***********************************************************************
HEADERS += \
    $$PWD/src/app/applicationmanager.hpp \
    $$PWD/src/app/applicationsettings.hpp

SOURCES += \
    $$PWD/src/app/main.cpp \
    $$PWD/src/app/applicationmanager.cpp \
    $$PWD/src/app/applicationsettings.cpp

INCLUDEPATH += \
    $$PWD/src/app


#************  Resources  *************************************************************************
RESOURCES += \
    $$PWD/resources.qrc


#************  Images Files  **********************************************************************
DISTFILES +=  \
    $$PWD/img/app/icon_launcher.svg \
    $$PWD/img/app/logo.svg \
    $$PWD/img/app/logo_foreground.svg \
    $$PWD/img/icons/refresh.svg \
    $$PWD/img/icons/alert.svg \
    qml/views/StorageDetailsView.qml


#************  QML Files  *************************************************************************
DISTFILES += \
    $$PWD/qml/Main.qml \
    $$PWD/qml/delegates/StorageDeviceDelegate.qml \
    $$PWD/qml/pages/SplashPage.qml \
    $$PWD/qml/pages/HomePage.qml \
    $$PWD/qml/views/StorageDetailsView.qml \
    $$PWD/qml/views/StorageListingView.qml


##************  Android Configurations  ************************************************************
android {
    QT += androidextras
    DISTFILES += \
        $$PWD/android/AndroidManifest.xml \
        $$PWD/android/gradle/wrapper/gradle-wrapper.jar \
        $$PWD/android/gradle/wrapper/gradle-wrapper.properties \
        $$PWD/android/gradlew \
        $$PWD/android/gradlew.bat \
        $$PWD/android/build.gradle \
        $$PWD/android/res/values/libs.xml \
        $$PWD/android/res/drawable/splash.xml \
        $$PWD/android/res/mipmap-ldpi/icon_launcher.png \
        $$PWD/android/res/mipmap-mdpi/icon_launcher.png \
        $$PWD/android/res/mipmap-hdpi/icon_launcher.png \
        $$PWD/android/res/mipmap-xhdpi/icon_launcher.png \
        $$PWD/android/res/mipmap-xxhdpi/icon_launcher.png \
        $$PWD/android/res/mipmap-xxxhdpi/icon_launcher.png \
        $$PWD/android/src/org/xapps/xstoragedemo/XStorageDemoActivity.java

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}

#contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
#    QT += androidextras
#    ANDROID_PACKAGE_SOURCE_DIR = \
#        $$PWD/android
#}
