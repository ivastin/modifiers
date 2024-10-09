package com.example.myapplication.uiscreens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.example.myapplication.model.Item
import com.example.myapplication.model.ItemDetails
import androidx.compose.ui.unit.dp

@Composable
fun ItemDetails(state: ItemDetailsUiState,
                modifier: Modifier = Modifier) {
    when (state) {
        is ItemDetailsUiState.Loading -> LoadingScreen(modifier = modifier.fillMaxSize())
        is ItemDetailsUiState.Success -> ResultScreen(
            state.item,
            modifier
        )
        is ItemDetailsUiState.Error -> ErrorScreen(
            state.errorDescription,
            modifier = modifier.fillMaxSize()
        )
    }
}

@Composable
fun ResultScreen(item: ItemDetails, modifier: Modifier = Modifier) {
    Column(modifier = modifier // same as the function parameter
        .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    )  {
        Text(text = item.item.title, style = MaterialTheme.typography.titleLarge)
        Text(text = item.item.description, style = MaterialTheme.typography.bodyLarge)
        Text(text = item.content, style = MaterialTheme.typography.bodyLarge)
        Text(text = item.item.type, style = MaterialTheme.typography.bodyLarge)
    }
}