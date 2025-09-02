package com.igaworks.adbrix.flutter;

import android.app.Application;
import android.content.Context;
import android.util.Log;

import androidx.annotation.NonNull;

import com.igaworks.adbrix.Adbrix;
import com.igaworks.adbrix.AdbrixActivityLifecycleCallbacks;
import com.igaworks.adbrix.AdbrixBridge;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** AdbrixPlugin */
public class AdbrixPlugin implements FlutterPlugin, MethodCallHandler {
  private static final String TAG = "abx_AdbrixPlugin";
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private AdbrixBridge adbrixBridge;
  private Context context;
  private static final String CLASS_ADBRIX = "Adbrix";
  private static final String KEY_STRING_CLASS_NAME = "className";
  private static final String KEY_STRING_METHOD_NAME = "methodName";
  /**
   * Parameters of the method to call
   */
  private static final String KEY_OBJECT_METHOD_PARAM = "methodParam";
  private static final String KEY_ANY_METHOD_ARGS_1 = "args1";
  private static final String KEY_ANY_METHOD_ARGS_2 = "args2";
  private static final String KEY_ANY_METHOD_ARGS_3 = "args3";
  private AdbrixActivityLifecycleCallbacks lifecycleCallbacks;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "adbrix_plugin");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
    lifecycleCallbacks = new AdbrixActivityLifecycleCallbacks();
    ((Application)context).registerActivityLifecycleCallbacks(lifecycleCallbacks);
    adbrixBridge = AdbrixBridge.getInstance();
    adbrixBridge.registerAdbrixDeferredDeepLinkListener(0);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if(adbrixBridge == null){
      Log.d(TAG, "adbrixBridge is null");
      return;
    }
    if (call.method.equals("logEvent")) {
      String eventName = call.argument("eventName");
      Map<String, Object> properties = call.argument("properties");
      if(eventName == null){
        Log.e(TAG, "eventName is null");
        return;
      }
      if(properties != null){
        Adbrix.getInstance().logEvent(eventName, new JSONObject(properties));
      } else{
        Adbrix.getInstance().logEvent(eventName);
      }
    } else if(call.method.equals("enableSDK")){
      Adbrix.getInstance().enableSDK();
    } else if(call.method.equals("disableSDK")) {
      Adbrix.getInstance().disableSDK();
    } else if (call.method.equals("init")) {
      String applicationKey = call.argument("applicationKey");
      String secretKey = call.argument("secretKey");
      adbrixBridge.init(context, applicationKey, secretKey);
    } else if (call.method.equals("initWithConfig")) {
      String applicationKey = call.argument("applicationKey");
      String secretKey = call.argument("secretKey");
      Map<String, Object> config = call.argument("config");
      JSONObject root = new JSONObject(config);
      adbrixBridge.init(context, applicationKey, secretKey, root.toString());
    } else if (call.method.equals("blockDeferredDeepLinkLaunch")) {
      adbrixBridge.blockDeferredDeepLinkLaunch(new AdbrixBridge.AdbrixDeferredDeepLinkCallback() {
        @Override
        public void onCallback(int resultCode, String deepLink) {
          if(deepLink != null && !deepLink.isEmpty()){
            Map<String, Object> map = new HashMap<>();
            map.put("result", resultCode);
            map.put("deepLink", deepLink);
            result.success(map);
          } else{
            result.error("NullPointerException", "result is null", null);
          }
        }
      });
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
    ((Application)binding.getApplicationContext()).unregisterActivityLifecycleCallbacks(lifecycleCallbacks);
    lifecycleCallbacks = null;
    context = null;
    adbrixBridge = null;
    channel = null;
  }
}
