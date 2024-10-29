package com.example.helloworld_p1

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Find the TextView and Button by their IDs
        val textView: TextView = findViewById(R.id.textView)
        val button: Button = findViewById(R.id.button2)

        // Set an OnClickListener to the Button
        button.setOnClickListener {
            textView.text = "Button Clicked!"
        }
    }
}
