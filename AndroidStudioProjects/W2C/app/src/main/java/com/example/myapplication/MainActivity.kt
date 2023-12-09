package com.example.myapplication

import android.content.Intent
import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_main)
        val loginButton = findViewById<Button>(R.id.loginButton)



        loginButton.setOnClickListener {
            val intent = Intent(this, LoginPage::class.java)
            startActivity(intent)
        }
            val registerButton = findViewById<Button>(R.id.registerButton)
            registerButton.setOnClickListener {
                val intent = Intent(this, RegisterPage::class.java)
                startActivity(intent)
            }
        }
    }
