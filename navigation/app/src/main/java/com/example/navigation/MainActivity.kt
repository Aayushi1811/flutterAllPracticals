package com.example.navigation
import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.activity.ComponentActivity

class MainActivity : ComponentActivity() {
    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)



        val btnLogin = findViewById<Button>(R.id.button2)


        btnLogin.setOnClickListener {

            val intent = Intent(this, PolicyActivity::class.java)
            startActivity(intent)
        }
    }
}
