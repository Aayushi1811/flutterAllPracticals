package com.example.login_logout

import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class HomeActivity : AppCompatActivity() {

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
        setContentView(R.layout.activity_home)

        Log.d("HomeActivity", "onCreate: Initializing SharedPreferences")

        // Initialize SharedPreferences
        sharedPreferences = getSharedPreferences(SHARED_PREFS, Context.MODE_PRIVATE)

        // Get the saved email from SharedPreferences
        val email = sharedPreferences.getString(EMAIL_KEY, "User")

        Log.d("HomeActivity", "onCreate: Email: $email")

        // Initialize views
        val welcomeTV = findViewById<TextView>(R.id.textView)
        val logoutBtn = findViewById<Button>(R.id.button2)

        // Set welcome message with the email
        welcomeTV.text = "Welcome, $email"

        // OnClickListener for logout button
        logoutBtn.setOnClickListener {
            // Clear SharedPreferences
            val editor = sharedPreferences.edit()
            editor.clear()
            editor.apply()

            Log.d("HomeActivity", "onClick: SharedPreferences Cleared")

            // Redirect to MainActivity after logout
            val intent = Intent(this@HomeActivity, MainActivity::class.java)
            startActivity(intent)
            finish()  // Close HomeActivity
        }
    }
}
