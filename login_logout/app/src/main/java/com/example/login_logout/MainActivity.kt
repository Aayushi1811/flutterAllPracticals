package com.example.login_logout

import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.os.Bundle
import android.text.TextUtils
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    // Constants for shared preferences
    companion object {
        const val SHARED_PREFS = "shared_prefs"
        const val EMAIL_KEY = "email_key"
        const val PASSWORD_KEY = "password_key"
    }

    // SharedPreferences object
    private lateinit var sharedPreferences: SharedPreferences

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        Log.d("MainActivity", "onCreate: Initializing SharedPreferences")

        // Initialize SharedPreferences
        sharedPreferences = getSharedPreferences(SHARED_PREFS, Context.MODE_PRIVATE)

        // Initialize views
        val emailEdt = findViewById<EditText>(R.id.editTextTextEmailAddress)
        val passwordEdt = findViewById<EditText>(R.id.editTextTextPassword)
        val loginBtn = findViewById<Button>(R.id.button)

        // OnClickListener for login button
        loginBtn.setOnClickListener {
            val email = emailEdt.text.toString()
            val password = passwordEdt.text.toString()

            Log.d("MainActivity", "onClick: Email: $email, Password: $password")

            // Check if the fields are empty
            if (TextUtils.isEmpty(email) || TextUtils.isEmpty(password)) {
                Toast.makeText(this@MainActivity, "Please enter email and password", Toast.LENGTH_SHORT).show()
            } else {
                // Save email and password in SharedPreferences
                val editor = sharedPreferences.edit()
                editor.putString(EMAIL_KEY, email)
                editor.putString(PASSWORD_KEY, password)
                editor.apply()

                Log.d("MainActivity", "onClick: SharedPreferences Updated")

                // Start HomeActivity
                val intent = Intent(this@MainActivity, HomeActivity::class.java)
                startActivity(intent)
                finish()  // Close MainActivity
            }
        }
    }

    override fun onStart() {
        super.onStart()

        // Check if email and password are already saved in SharedPreferences
        val email = sharedPreferences.getString(EMAIL_KEY, null)
        val password = sharedPreferences.getString(PASSWORD_KEY, null)

        Log.d("MainActivity", "onStart: Email: $email, Password: $password")

        // If both email and password are not null, go to HomeActivity
        if (!email.isNullOrEmpty() && !password.isNullOrEmpty()) {
            val intent = Intent(this@MainActivity, HomeActivity::class.java)
            startActivity(intent)
            finish()  // Close MainActivity
        }
    }
}
