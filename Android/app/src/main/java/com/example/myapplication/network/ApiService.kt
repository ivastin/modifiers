package com.example.myapplication.network

import android.util.Log
import com.example.myapplication.model.Item
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET


//private const val BASE_URL = "http://192.168.100.65:8080/" // office
//private const val BASE_URL = "http://192.168.1.48:8080/" // home
private const val BASE_URL = "http://192.168.2.191:8080/" // home miw


//private const val BASE_URL = "http://localhost:8080/"
//private const val BASE_URL = "http://:8080/"
//http://192.168.100.65:8080

//http://localhost:8080/

private val retrofit = Retrofit.Builder()
    .addConverterFactory(GsonConverterFactory.create())
    .baseUrl(BASE_URL)
    .build()

/**
 * Retrofit service object for creating api calls
 */
interface ApiService {
    @GET("items/")
    suspend fun getItems(): List<Item>
}

/**
 * A public Api object that exposes the lazy-initialized Retrofit service
 */
object ItemsApi {
    val retrofitService: ApiService by lazy {
        Log.d("RETROFIT", "creating retrofit")
        Log.d("RETROFIT", "creating retrofit 2 test")
        Log.d("RETROFIT", BASE_URL)
        retrofit.create(ApiService::class.java)
    }
}


//<!--
//android:networkSecurityConfig="@xml/network_security_config"
//-->