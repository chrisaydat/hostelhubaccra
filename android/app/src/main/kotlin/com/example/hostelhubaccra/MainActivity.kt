package com.example.hostelhubaccra

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Register the shared_preferences plugin
        val sharedPreferencesEngine = buildSharedPreferencesEngine()
        sharedPreferencesEngine.registerWith(flutterEngine)
    }

    private fun buildSharedPreferencesEngine(): SharedPreferencesPlugin {
        val sharedPreferencesProvider = SharedPreferencesProvider()
        return SharedPreferencesPlugin(sharedPreferencesProvider, activity)
    }
}