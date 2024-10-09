package com.example.myapplication.uiscreens

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.myapplication.model.Item
import android.util.Log
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.expandVertically
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.shrinkVertically
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.material3.Button
import androidx.compose.runtime.remember
import androidx.compose.ui.platform.LocalDensity

class ItemList {
}


@Composable
fun ItemList(state: ItemsUiState,
             modifier: Modifier = Modifier, onItemClick: (Item) -> Unit) {
    Log.d("UIItems", "creating list view")
    when (state) {
        is ItemsUiState.Loading -> LoadingScreen(modifier = modifier.fillMaxSize())
        is ItemsUiState.Success -> ResultScreen(
            state.items,
            onItemClick,
            modifier
        )
        is ItemsUiState.Error -> ErrorScreen(
            state.errorDescription,
            modifier = modifier.fillMaxSize()
        )
    }
}


/**
 * The home screen displaying the loading message.
 */
@Composable
fun LoadingScreen(modifier: Modifier = Modifier) {
    Text("loading ...")
}

/**
 * The home screen displaying error message with re-attempt button.
 */
@Composable
fun ErrorScreen(errorDescription: String, modifier: Modifier = Modifier) {
    Column(
        modifier = modifier,
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text("Something went wrong!", modifier = Modifier.padding(16.dp))
        Text(errorDescription, modifier = Modifier.padding(16.dp))
    }
}



/**
 * ResultScreen displaying number of photos retrieved.
 */
@Composable
fun ResultScreen(listItems: List<Item>, onItemClick: (Item) -> Unit, modifier: Modifier = Modifier) {
    Column {

        animationExample()

        listItems.forEach { item ->
            Text(text = item.title, style = MaterialTheme.typography.titleLarge)
            Text(text = item.description, style = MaterialTheme.typography.bodyMedium)
            Button(onClick = { onItemClick(item)}){
                Text("Go")
            }
        }
    }
}

@Composable
fun animationExample() {
    var visible by remember { mutableSetOf(true) }
    val density = LocalDensity.current
    AnimatedVisibility(
        visible = visible,
        enter = slideInVertically {
            // Slide in from 40 dp from the top.
            with(density) { -40.dp.roundToPx() }
        } + expandVertically (
            // Expand from the top.
            expandFrom = Alignment.Top
        ) + fadeIn (
            // Fade in with the initial alpha of 0.3f.
            initialAlpha = 0.3f
        ),
        exit = slideOutVertically() + shrinkVertically() + fadeOut()
    ) {
        Text(
            "Hello",
            Modifier
                .fillMaxWidth()
                .height(200.dp)
        )
    }

}

@Preview(showBackground = true)
@Composable
fun LoadingScreenPreview() {
        LoadingScreen()
}

@Preview(showBackground = true)
@Composable
fun ErrorScreenPreview() {
        ErrorScreen("error!")
}


