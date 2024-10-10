package com.example.myapplication.model

import kotlinx.serialization.Serializable

@Serializable
data class ItemDetails (
    var item: Item,
    val content: String,
    val description: String
)
