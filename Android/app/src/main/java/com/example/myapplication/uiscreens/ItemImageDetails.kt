package com.example.myapplication.uiscreens

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Button
import androidx.compose.material3.Divider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.style.TextAlign
import com.example.myapplication.model.Item
import com.example.myapplication.model.ItemDetails
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import coil.compose.AsyncImage
import com.example.myapplication.R

//import coil3.compose.AsyncImage

@Composable
fun ItemImageDetails(state: ItemDetailsUiState,
                     goHomeScreen: () -> Unit,
                modifier: Modifier = Modifier) {
    when (state) {
        is ItemDetailsUiState.Loading -> LoadingScreen(modifier = modifier.fillMaxSize())
        is ItemDetailsUiState.Success -> ResultImageScreen(
            state.item,
            goHomeScreen,
            modifier
        )
        is ItemDetailsUiState.Error -> ErrorScreen(
            state.errorDescription,
            modifier = modifier.fillMaxSize()
        )
    }
}

@Composable
fun ResultImageScreen(item: ItemDetails, goHomeScreen: () -> Unit, modifier: Modifier = Modifier) {
    Column(
        modifier = Modifier
        //modifier.then(reusableDetailModifier)
        //.padding(16.dp)
        .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    )  {
        DetailHeader(goHomeScreen = goHomeScreen)
        Divider(modifier = Modifier.fillWidthOfParent(32.dp))
        Text(text = item.item.title, style = MaterialTheme.typography.titleLarge)
        AsyncImage(
            model = item.content,
            contentDescription = "Some image",
            modifier = Modifier
                .fillMaxWidth()
                .heightIn(0.dp, 210.dp)
        )
        Text(text = item.description, style = MaterialTheme.typography.bodyLarge)
    }
}

