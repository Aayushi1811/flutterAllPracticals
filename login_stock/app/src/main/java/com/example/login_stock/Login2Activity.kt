package com.example.login_stock



import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.RadioButton
import android.widget.TextView
import android.widget.Toast
import androidx.activity.ComponentActivity

class Login2Activity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.login2) // Link this to your login2.xml layout
        val usernameTextView = findViewById<TextView>(R.id.textView)
        val passwordEditText = findViewById<EditText>(R.id.editTextTextPassword2)
        val emailEditText = findViewById<EditText>(R.id.editTextTextEmailAddress)
        val phoneEditText = findViewById<EditText>(R.id.editTextPhone)
        val postalAddressEditText = findViewById<EditText>(R.id.editTextTextPostalAddress)
        val timeEditText = findViewById<EditText>(R.id.editTextTime)
        val dateEditText = findViewById<EditText>(R.id.editTextDate)
        val cricketRadioButton = findViewById<RadioButton>(R.id.radioButton)
        val footballRadioButton = findViewById<RadioButton>(R.id.radioButton2)
        val stockButton = findViewById<Button>(R.id.button2)

        // Add logic for the button
        stockButton.setOnClickListener {
            val intent = Intent(this@Login2Activity, StockManagementActivity::class.java)
            startActivity(intent)

            // Example: Display the entered email in a Toast when email field changes
            emailEditText.setOnFocusChangeListener { _, hasFocus ->
                if (!hasFocus) {
                    val enteredEmail = emailEditText.text.toString()
                    Toast.makeText(this, "Entered Email: $enteredEmail", Toast.LENGTH_SHORT).show()
                }
            }

            // Add any other functionality you need for the views here
            // Navigate to StockManagementActivity

        }
    }
}
