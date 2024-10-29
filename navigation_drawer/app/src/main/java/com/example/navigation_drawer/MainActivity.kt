package com.example.navigation_drawer

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController

import com.example.navigation_drawer.R.id.nav_gallery

class LoginFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_home, container, false)
    }
    private fun performLogin(username: String, password: String) {
        // Perform your login logic here (e.g., authentication)
        // On successful login:
        findNavController().navigate(nav_gallery) // Navigate to HomeFragment
    }
    // Implement your login logic here (e.g., validate user input, authenticate user)
}
