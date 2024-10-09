package com.example.myapplication.uiscreens

import android.util.Log
import androidx.compose.foundation.lazy.staggeredgrid.rememberLazyStaggeredGridState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.viewModelScope
import com.example.myapplication.model.Item
import com.example.myapplication.model.ItemDetails
import com.example.myapplication.network.ItemsApi
import kotlinx.coroutines.launch
import retrofit2.HttpException
import java.io.IOException

sealed interface ItemDetailsUiState {
    data class Success(val item: ItemDetails) : ItemDetailsUiState
    //object Error : ItemsUiState
    data class Error(var errorDescription: String) : ItemDetailsUiState
    object Loading : ItemDetailsUiState
}

class ItemDetailsViewModel(val item: Item, state: ItemDetailsUiState): ViewModel() {
    var itemState:  ItemDetailsUiState by mutableStateOf( ItemDetailsUiState.Loading)
        private set
    init {
        Log.d("ItemsDetailsVM", "init")
        Log.d("ItemsDetailsVM", item.title)
        getDetails(item.id)
    }

    fun getDetails(id: String) {
        Log.d("ItemsDetailsVM", "Getting items")

        viewModelScope.launch {
            itemState = ItemDetailsUiState.Loading
            itemState = try {
                val result = ItemsApi.retrofitService.getDetails(id = id)
                Log.d("ItemsDetailsVM", "item ok")
                Log.d("ItemsDetailsVM", result.content)
                ItemDetailsUiState.Success(
                    item = result
                )
            } catch (e: IOException) {
                Log.e("ItemsDetailsVM", "error ioexception")
                Log.e("ItemsDetailsVM", e.toString())
                ItemDetailsUiState.Error(
                    errorDescription = e.toString()
                )
            } catch (e: HttpException) {
                Log.e("IItemsDetailsVM", "error httpxception")
                Log.e("ItemsDetailsVM", e.toString())
                ItemDetailsUiState.Error(
                    errorDescription = e.toString()
                )
            }
        }
    }
}

//class MyViewModelFactory(private val item: Item) : ViewModelProvider.NewInstanceFactory() {
//    override fun <T : ViewModel?> create(modelClass: Class<T>): T = ItemDetailsViewModel(item) as T
//}