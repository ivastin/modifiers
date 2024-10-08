package com.example.myapplication.model

import kotlinx.serialization.*

@Serializable
data class Item (
    val title: String,
    val description: String,
    val id: String,
    val type: String
)