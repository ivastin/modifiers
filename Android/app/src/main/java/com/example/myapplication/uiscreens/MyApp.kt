package com.example.myapplication.uiscreens

import androidx.compose.runtime.Composable
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.toRoute
import com.example.myapplication.model.Item
import kotlinx.serialization.Serializable

@Serializable
object StartList

@Composable
fun MyApp() {
    val navController = rememberNavController()
    val itemsViewModel: ItemsViewModel = viewModel()
    NavHost(navController = navController, startDestination = StartList)
    {
        composable<StartList> { backStackEntry ->
            ItemList(
                state = itemsViewModel.itemsState,
                onItemClick = {
                    navController.navigate(route = it)
                }
            )
        }
        composable<Item> { backStackEntry ->
            val item: Item = backStackEntry.toRoute()
            val vm: ItemDetailsViewModel = viewModel() {
                ItemDetailsViewModel(item, ItemDetailsUiState.Loading)
            }
            ItemDetails(vm.itemState)
        }
    }
}