package com.example.myapplication.model

import kotlinx.serialization.*

@Serializable
data class Item (
    val title: String,
    val id: String,
    val type: String
)



// TODO: agenda
//1. Modifiers general, fillWidth, background
//2. example padding, clip,
//3. order -> reusableDetailModifier
//4. best practice, chain, than
//5. scroll
//6. .clickable{ onItemClick(item) }

//8. fillWidthOfParent
//8. razočaranje, text => iOS

