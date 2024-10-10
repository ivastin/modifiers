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
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.TextButton
import androidx.compose.runtime.remember
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.unit.sp
import com.example.myapplication.R

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
            //modifier.background(Color.LightGray.copy(alpha = 0.2f))
            //modifier.background(Color.Blue)
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
    Column(
        verticalArrangement = Arrangement.spacedBy(1.dp),
        modifier = modifier
            .fillMaxWidth(fraction = 1.0f)
            //.background(Color.Red)
            //.background(Color.LightGray.copy(alpha = 0.2f)),

    ) {
        Text("Tasks",
            fontSize = 24.sp,
            modifier = Modifier
                .fillMaxWidth()
                .padding(top = 16.dp, start = 16.dp)
        )

        listItems.forEach { item ->
            Box (
                modifier = modifier
                    .padding(top = 8.dp, bottom = 1.dp, start = 8.dp, end = 8.dp)
                    //.clip(shape = RoundedCornerShape(16.dp))
                    .background(Color.White)
            )
            {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    modifier = Modifier.padding(start = 16.dp)

                ) {
                    Text(
                        text = item.title,
                        fontSize = 16.sp,
                        lineHeight = 20.sp,
                        modifier = modifier
                            .fillMaxWidth(fraction = 0.8f)
                            .background(Color.White)
                    )
                    TextButton(
                        onClick = { onItemClick(item) },
                        modifier = Modifier.size(width = 64.dp, height = 64.dp)
                    ) {
                        //Text("Go")
                        Image(
                            painter = painterResource(id = R.drawable.arrow_small_right),
                            contentDescription = "arrow",
                            contentScale = ContentScale.FillHeight,
                        )
                    }
                }
            }
        }
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


