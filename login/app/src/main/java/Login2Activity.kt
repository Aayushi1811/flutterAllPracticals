package com.example.login

import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity

class Login2Activity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.login2) // Link this to your login2.xml layout

        // Navigate to StockManagementActivity
        val intent1 = Intent(this@Login2Activity, StockManagementActivity::class.java)
        startActivity(intent1)
    }
}
