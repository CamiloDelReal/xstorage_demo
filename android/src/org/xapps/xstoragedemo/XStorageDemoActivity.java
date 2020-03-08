package org.xapps.xstoragedemo;

import org.qtproject.qt5.android.bindings.QtActivity;
import org.xapps.libraries.xstorage.StorageNotificationRunner;


public class XStorageDemoActivity extends QtActivity {

    private StorageNotificationRunner m_notificatorRunner = null;

    public void startStorageNotificationListener() {
        m_notificatorRunner = new StorageNotificationRunner(this);
        runOnUiThread(m_notificatorRunner);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        if(m_notificatorRunner != null) {
            m_notificatorRunner.clearReceiver();
        }
    }
}
