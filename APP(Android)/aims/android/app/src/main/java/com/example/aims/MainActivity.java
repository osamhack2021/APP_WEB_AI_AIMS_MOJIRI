package com.example.aims;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import android.content.Context;
import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Intent;
import android.content.IntentFilter;
import android.widget.Toast;
import androidx.annotation.NonNull;
import android.view.WindowManager;
import android.os.UserManager;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.example.aims/camera";
    static final int RESULT_ENABLE = 1;
    DevicePolicyManager deviceManager;
    ComponentName compName;

@Override
public void configureFlutterEngine(FlutterEngine flutterEngine) {
    getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
    compName = new ComponentName(this, AppDeviceAdminReceiver.class);
    deviceManager = (DevicePolicyManager)
            getSystemService(Context.DEVICE_POLICY_SERVICE);
    super.configureFlutterEngine(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
                @Override
                public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                    if (call.method.equals("setDisableCamera")) {
                        Intent intent = new Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN);
                        intent.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, compName);
                        intent.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, "You should enable the app!");
                        startActivityForResult(intent, RESULT_ENABLE);
                    } else if(call.method.equals("setEnableCamera")) {
                        deviceManager.setCameraDisabled(compName, false);
                    } else if(call.method.equals("setDisableCameraFinishTaking")) {
                        deviceManager.setCameraDisabled(compName, true);
                    } else if(call.method.equals("getCameraDisabled")) {
                        result.success(deviceManager.getCameraDisabled(compName));
                    } else if(call.method.equals("setUsbEnable")) {
                        deviceManager.addUserRestriction(compName, UserManager.DISALLOW_USB_FILE_TRANSFER);
                        deviceManager.addUserRestriction(compName, UserManager.DISALLOW_CONFIG_TETHERING);
                    }
                }
            });
}

@Override
protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    super.onActivityResult(requestCode, resultCode, data);
    switch (requestCode) {
        case RESULT_ENABLE:
            if (resultCode == Activity.RESULT_OK) {
                deviceManager.setCameraDisabled(compName, true);
            }
            return;
    }
}
}