package com.example.myapplication.model

import kotlinx.serialization.Serializable

@Serializable
data class ItemDetails (
    var item: Item,
    var loadingTime: Int,
    val content: String
)
