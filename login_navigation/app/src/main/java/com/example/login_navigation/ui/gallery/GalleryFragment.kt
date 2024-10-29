package com.example.login_navigation.ui.stock

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.fragment.app.Fragment
import com.example.login_navigation.R

class GalleryFragment : Fragment() {

    private var totalPrice = 0.0 // Variable to hold total price

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_gallery, container, false)

        // Find views
        val itemPriceEditText = view.findViewById<EditText>(R.id.itemPriceEditText)
        val addItemButton = view.findViewById<Button>(R.id.addItemButton)
        val totalTextView = view.findViewById<TextView>(R.id.totalTextView)

        // Set click listener on the button
        addItemButton.setOnClickListener {
            // Get the price entered by the user
            val itemPriceString = itemPriceEditText.text.toString()
            if (itemPriceString.isNotEmpty()) {
                val itemPrice = itemPriceString.toDoubleOrNull()
                if (itemPrice != null) {
                    totalPrice += itemPrice // Update total price
                    totalTextView.text = String.format("Total Price: $%.2f", totalPrice) // Update the total display
                    itemPriceEditText.text.clear() // Clear the input field
                } else {
                    itemPriceEditText.error = "Invalid price entered"
                }
            } else {
                itemPriceEditText.error = "Please enter a price"
            }
        }

        return view
    }
}
