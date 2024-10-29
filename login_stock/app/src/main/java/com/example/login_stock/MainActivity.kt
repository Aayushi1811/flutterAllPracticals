package com.example.login_stock



import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.activity.ComponentActivity

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.login)

        // Find views by ID
        val etUsername = findViewById<EditText>(R.id.editTextText2)
        val btnLogin = findViewById<Button>(R.id.button)

        // Set onClickListener for the Login button
        btnLogin.setOnClickListener {
            // Get the username entered
            val username = etUsername.text.toString()

            // Display the username using Toast
            Toast.makeText(this, "Welcome: $username", Toast.LENGTH_SHORT).show()

            // Navigate to Login2Activity
            val intent = Intent(this@MainActivity, Login2Activity::class.java)
            startActivity(intent)
        }
    }
}
