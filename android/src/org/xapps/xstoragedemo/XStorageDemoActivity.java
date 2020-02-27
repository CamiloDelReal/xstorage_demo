package org.xapps.xstoragedemo;

import org.qtproject.qt5.android.bindings.QtActivity;
import org.xapps.libraries.xstorage.StorageNotificationRunner;

public class XStorageDemoActivity extends QtActivity {
    public void startStorageNotificationListener() {
        runOnUiThread(new StorageNotificationRunner(this));
    }
}
