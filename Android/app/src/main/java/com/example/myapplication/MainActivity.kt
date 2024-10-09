package com.example.myapplication

import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.myapplication.model.Item
import com.example.myapplication.ui.theme.MyApplicationTheme
import com.example.myapplication.uiscreens.ItemList
import com.example.myapplication.uiscreens.ItemsUiState
import com.example.myapplication.uiscreens.ItemsViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.rememberNavController
import com.example.myapplication.uiscreens.MyApp
import kotlinx.serialization.*



//@Serializable
//data class ItemNavData(val id: String, val type: String)

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            Surface(modifier = Modifier
                .fillMaxHeight()
                .background(Color.Black), color = MaterialTheme.colorScheme.background) {
                MyApp()
            }
        }
    }
}



    /*
                MyApplicationTheme {
                // A surface container using the 'background' color from the theme
                //Surface(modifier = Modifier.fillMaxSize(), color = MaterialTheme.colorScheme.background)
                Surface(modifier = Modifier
                    .fillMaxHeight(0.5F)
                    .background(Color.Black), color = MaterialTheme.colorScheme.background) {
                    //Greeting("Cobe")
                    //val items = listOf<Item>()
                    val items = listOf(
                        Item(title = "title", description = "desc", id = "someId", type = "someType")
                    )
                    //val viewModel: ItemsViewModel = ItemsViewModel()
                    val viewModel: ItemsViewModel = viewModel()
                    //ItemList(listItems = items, onItemClick = {})
                    ItemList(viewModel.itemsState ,onItemClick = {
                        Log.d("APP", "go to details:")
                        Log.d("APP", it.title)
                    })
                }
            }
        }
     */

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    //Surface(color = Color.Cyan) {
    Surface() {
        Text(
            text = "Hello $name!",
            modifier = modifier.padding(24.dp)
//            Modifier
//                .padding(48.dp)
//                .background(Color.Red)
        )
    }
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    MyApplicationTheme {
        Greeting("Mladen")
    }
}