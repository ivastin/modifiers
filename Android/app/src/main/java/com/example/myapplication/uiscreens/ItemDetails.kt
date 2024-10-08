package com.example.myapplication.uiscreens

import androidx.compose.foundation.layout.Column
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import com.example.myapplication.model.Item

//class ItemDetails {
//}



@Composable
fun ItemDetails(item: Item) {
        Column() {
            Text(text = item.title, style = MaterialTheme.typography.titleLarge)
            Text(text = item.description, style = MaterialTheme.typography.bodyMedium)
        }
}