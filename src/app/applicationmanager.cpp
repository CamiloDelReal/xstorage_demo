#include <QtQml>
#include <QStandardPaths>

#include "applicationmanager.hpp"


ApplicationManager::ApplicationManager(QObject *parent)
    : MobileManager(parent)
{
}

void ApplicationManager::addContextProperty(QQmlEngine *engine, QQmlContext *context)
{
    m_engine = engine;

    //Register singletons
    qmlRegisterSingletonType(QUrl(QLatin1String("qrc:/qml/XMaterialControls.qml")), "XApps.XMaterialControls", 1, 0, "XMaterialControls");

    //Link C++ objects with QML
    context->setContextProperty("ApplicationManagerObj", this);
    context->setContextProperty("ApplicationSettingsObj", &m_applicationSettings);
    context->setContextProperty("StorageManagerObj", &m_storageManager);
}

void ApplicationManager::initialize()
{
    m_storageManager.initialize();
}

void ApplicationManager::onAboutToQuit()
{
    m_applicationSettings.saveSettings();
}

void ApplicationManager::onApplicationStateChanged(Qt::ApplicationState applicationState)
{
    if(applicationState == Qt::ApplicationState::ApplicationSuspended)
        onAboutToQuit();
}
