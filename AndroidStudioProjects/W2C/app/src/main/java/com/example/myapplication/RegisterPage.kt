package com.example.myapplication

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.Spinner
import androidx.appcompat.app.AppCompatActivity

class RegisterPage : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.register_page)
        val items = listOf("Выберите свой город", "Элемент 1", "Элемент 2", "Элемент 3")
        val adapter = ArrayAdapter(this, android.R.layout.simple_spinner_item, items)
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        val spinner = findViewById<Spinner>(R.id.spinner)
        spinner.adapter = adapter
        spinner.post {
            val firstItemView = (spinner.getChildAt(0) as? View)
            firstItemView?.alpha = 0.5f
        }
        val registerButton = findViewById<Button>(R.id.nextButton)
        registerButton.setOnClickListener {
            val intent = Intent(this, RegisterPage2::class.java)
            startActivity(intent)
        }

    }
    }