package com.example.myapplication.uiscreens

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.selection.selectable
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Button
import androidx.compose.material3.Divider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.layout.layout
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.Dp
import com.example.myapplication.model.Item
import com.example.myapplication.model.ItemDetails
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.myapplication.R

@Composable
fun ItemDetails(state: ItemDetailsUiState,
                goHomeScreen: () -> Unit,
                modifier: Modifier = Modifier) {
    when (state) {
        is ItemDetailsUiState.Loading -> LoadingScreen(modifier = modifier.fillMaxSize())
        is ItemDetailsUiState.Success -> ResultScreen(
            state.item,
            goHomeScreen,
            modifier then reusableDetailModifier
        )
        is ItemDetailsUiState.Error -> ErrorScreen(
            state.errorDescription,
            modifier = modifier.fillMaxSize()
        )
    }
}

@Composable
fun ResultScreen(item: ItemDetails, goHomeScreen: () -> Unit, modifier: Modifier = reusableDetailModifier) {
    Column(modifier = modifier // same as the function parameter
        //.padding(16.dp)
        .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    )  {
        DetailHeader(goHomeScreen = goHomeScreen)
        Divider(modifier = Modifier.fillWidthOfParent(32.dp))
        Text(text = item.item.title,
            style = MaterialTheme.typography.titleLarge)
        Text(text = item.content,
            style = MaterialTheme.typography.bodyLarge)
        Text(text = item.description,
            style = MaterialTheme.typography.bodyLarge, modifier = Modifier.selectable(true))
    }
}

val reusableDetailModifier = Modifier
    .background(Color.Gray.copy(alpha = 0.2f))
    .padding(16.dp)

@Composable
fun DetailHeader(title: String = "Task description",  goHomeScreen: () -> Unit, modifier: Modifier = Modifier) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.Start,
        modifier = Modifier
            .heightIn(0.dp, 52.dp)
            .padding(start = 0.dp)

    ) {
        TextButton(
            onClick = goHomeScreen,
            modifier = modifier.fillMaxWidth()
        ) {
            Image(
                painter = painterResource(id = R.drawable.back),
                contentDescription = "arrow",
                contentScale = ContentScale.FillHeight,
            )
            Text(
                text = title,
                color = Color.Black,
                fontSize = 17.sp,
                textAlign = TextAlign.Center,
                modifier = Modifier
                    .fillMaxWidth()
                    .offset(x = -12.dp)
            )
        }
    }
}

fun Modifier.fillWidthOfParent(parentPadding: Dp) = this.then(
    layout { measurable, constraints ->
        // This is to force layout to go beyond the borders of its parent
        val placeable = measurable.measure(
            constraints.copy(
                maxWidth = constraints.maxWidth + 2 * parentPadding.roundToPx(),
            ),
        )
        layout(placeable.width, placeable.height) {
            placeable.place(0, 0)
        }
    },
)