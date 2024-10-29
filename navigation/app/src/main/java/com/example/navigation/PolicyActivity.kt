package com.example.navigation

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.CheckBox
import android.widget.EditText
import androidx.activity.ComponentActivity




    class PolicyActivity : ComponentActivity() {
        @SuppressLint("MissingInflatedId")
        override fun onCreate(savedInstanceState: Bundle?) {
            super.onCreate(savedInstanceState)
            setContentView(R.layout.activity_policy)


            val Fullname = findViewById<EditText>(R.id.editTextText2)
            val Lastname = findViewById<EditText>(R.id.editTextText4)
            val phonenumber = findViewById<EditText>(R.id.editTextPhone)
            val email = findViewById<EditText>(R.id.editTextTextEmailAddress)
            val age = findViewById<EditText>(R.id.editTextNumber2)
            val male = findViewById<CheckBox>(R.id.checkBox)
            val female = findViewById<CheckBox>(R.id.checkBox2)

            val policyname = findViewById<EditText>(R.id.editTextText5)
            var years = findViewById<EditText>(R.id.editTextNumber4)
            val btn = findViewById<Button>(R.id.button)

            btn.setOnClickListener {

                val intent = Intent(this, FinalActivity::class.java)
                startActivity(intent)
            }
        }
    }













