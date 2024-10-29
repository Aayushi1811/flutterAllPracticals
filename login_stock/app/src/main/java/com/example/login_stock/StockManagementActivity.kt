package com.example.login_stock



import android.annotation.SuppressLint
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.activity.ComponentActivity

class StockManagementActivity : ComponentActivity() {

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.stock_management)

        // Find views by ID
        val etProductName = findViewById<EditText>(R.id.editTextText3)
        val etQuantity = findViewById<EditText>(R.id.editTextText4)
        val etPricePerUnit = findViewById<EditText>(R.id.editTextText5)
        val tvTotalAmount = findViewById<TextView>(R.id.textView7)
        val btnGenerateBill = findViewById<Button>(R.id.button3)

        // Set onClickListener for the bill generation button
        btnGenerateBill.setOnClickListener {
            val quantityString = etQuantity.text.toString()
            val pricePerUnitString = etPricePerUnit.text.toString()

            // Validate inputs
            if (quantityString.isEmpty() || pricePerUnitString.isEmpty()) {
                Toast.makeText(this, "Please enter both quantity and price", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            try {
                val quantity = quantityString.toInt()
                val pricePerUnit = pricePerUnitString.toDouble()

                val totalAmount = quantity * pricePerUnit

                // Display the total amount
                tvTotalAmount.text = "Total Amount: totalAmount"

            } catch (e: NumberFormatException) {
                Toast.makeText(this, "Please enter valid numbers for quantity and price", Toast.LENGTH_SHORT).show()
            }
        }
    }
}
