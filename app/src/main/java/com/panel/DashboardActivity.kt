package com.panel

import android.os.Bundle
import android.widget.*
import androidx.appcompat.app.AppCompatActivity
import okhttp3.*
import java.io.IOException

class DashboardActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_dashboard)

        val btn = findViewById<Button>(R.id.btnApi)
        val result = findViewById<TextView>(R.id.result)

        btn.setOnClickListener {
            val client = OkHttpClient()
            val request = Request.Builder()
                .url("https://api.tuservidor.com/status")
                .build()

            client.newCall(request).enqueue(object : Callback {
                override fun onFailure(call: Call, e: IOException) {
                    runOnUiThread {
                        result.text = "Error API"
                    }
                }

                override fun onResponse(call: Call, response: Response) {
                    runOnUiThread {
                        result.text = response.body?.string()
                    }
                }
            })
        }
    }
}