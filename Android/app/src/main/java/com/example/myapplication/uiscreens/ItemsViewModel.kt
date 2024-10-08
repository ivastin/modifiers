package com.example.myapplication.uiscreens

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.myapplication.model.Item
import kotlinx.coroutines.launch
import retrofit2.HttpException
import java.io.IOException
import com.example.myapplication.network.ItemsApi
import android.util.Log

/**
 * UI state for the Home screen
 */
sealed interface ItemsUiState {
    data class Success(val items: List<Item>) : ItemsUiState
    //object Error : ItemsUiState
    data class Error(var errorDescription: String) : ItemsUiState
    object Loading : ItemsUiState
}

class ItemsViewModel: ViewModel() {
    /** The mutable State that stores the status of the most recent request */
    var itemsState:  ItemsUiState by mutableStateOf( ItemsUiState.Loading)
        private set

    /**
     * Call getMarsPhotos() on init so we can display status immediately.
     */
    init {
        Log.d("ItemsVM", "init")
       getItems()
    }

    fun getItems() {
        Log.d("ItemsVM", "Getting items")

        viewModelScope.launch {
            itemsState = ItemsUiState.Loading
//            itemsState =  ItemsUiState.Success(
//                items = listOf(
//                    Item(title = "mocked title", description = "description", id = "someId", type = "someType")
//                )
//            )
            itemsState = try {
                val listResult = ItemsApi.retrofitService.getItems()
                ItemsUiState.Success(
                    items = listResult
                )
            } catch (e: IOException) {
                Log.e("ItemsVM", "error ioexception")
                Log.e("ItemsVM", e.toString())
                ItemsUiState.Error(
                    errorDescription = e.toString()
                )
            } catch (e: HttpException) {
                Log.e("ItemsVM", "error httpxception")
                Log.e("ItemsVM", e.toString())
                ItemsUiState.Error(
                    errorDescription = e.toString()
                )
            }
        }
    }
}