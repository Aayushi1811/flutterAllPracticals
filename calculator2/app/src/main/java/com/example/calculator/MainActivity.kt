package com.example.twonumbercalculator

import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.example.calculator.R

class MainActivity : AppCompatActivity() {

    private lateinit var firstNumber: EditText
    private lateinit var secondNumber: EditText
    private lateinit var resultTextView: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        firstNumber = findViewById(R.id.firstNumber)
        secondNumber = findViewById(R.id.secondNumber)
        resultTextView = findViewById(R.id.result)

        findViewById<Button>(R.id.buttonAdd).setOnClickListener { calculateResult(Operation.ADD) }
        findViewById<Button>(R.id.buttonSubtract).setOnClickListener { calculateResult(Operation.SUBTRACT) }
        findViewById<Button>(R.id.buttonMultiply).setOnClickListener { calculateResult(Operation.MULTIPLY) }
        findViewById<Button>(R.id.buttonDivide).setOnClickListener { calculateResult(Operation.DIVIDE) }
    }

    private fun calculateResult(operation: Operation) {
        val firstValue = firstNumber.text.toString().toDoubleOrNull()
        val secondValue = secondNumber.text.toString().toDoubleOrNull()

        if (firstValue == null || secondValue == null) {
            resultTextView.text = "Invalid input"
            return
        }

        val result = when (operation) {
            Operation.ADD -> firstValue + secondValue
            Operation.SUBTRACT -> firstValue - secondValue
            Operation.MULTIPLY -> firstValue * secondValue
            Operation.DIVIDE -> if (secondValue != 0.0) firstValue / secondValue else "Cannot divide by zero"
        }

        resultTextView.text = "Result: $result"
    }

    private enum class Operation {
        ADD, SUBTRACT, MULTIPLY, DIVIDE
    }
}
