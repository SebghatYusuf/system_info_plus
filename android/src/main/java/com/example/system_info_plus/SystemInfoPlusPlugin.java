package com.example.system_info_plus;

import android.app.ActivityManager;
import android.content.Context;

/**
 * SystemInfoPlusPlugin
 */
public class SystemInfoPlusPlugin implements FlutterPlugin, MethodCallHandler {


    private Context applicationContext;
    private MethodChannel methodChannel;

    @Override
    public void onAttachedToEngine(FlutterPluginBinding binding) {
        onAttachedToEngine(binding.getApplicationContext(), binding.getBinaryMessenger());
    }

    private void onAttachedToEngine(Context applicationContext, BinaryMessenger messenger) {
        this.applicationContext = applicationContext;
        methodChannel = new MethodChannel(messenger, "dev/system_info_plus");
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        applicationContext = null;
        methodChannel.setMethodCallHandler(null);
        methodChannel = null;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else if (call.method.equals("getMemorySpace")) {
            long res = getTotalRam() / 1048576L;
            int totalMemory = (int) res;
            result.success(totalMemory);
        } else {
            result.notImplemented();
        }
    }

    // Return total RAM in megabytes.
    private long getTotalRam() {
        ActivityManager actManager = (ActivityManager) applicationContext.getSystemService(Context.ACTIVITY_SERVICE);
        ActivityManager.MemoryInfo memInfo = new ActivityManager.MemoryInfo();
        assert actManager != null;
        actManager.getMemoryInfo(memInfo);
        return memInfo.totalMem;
    }
}
