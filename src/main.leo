function main(unsorted: [u32; 10]) -> [u32; 10]{
    return insertion_sort(unsorted);
}

//Actual selection sort algorithm.

function selection_sort(arr: [u32; 10]) -> [u32; 10] {
   for i in 0..9{
       let min_index_so_far = i;
       for j in i+1..10{
           if(arr[j] < arr[min_index_so_far]){
             min_index_so_far = j; // getting the index of minimum value in the unsorted right side part of the array.
           }
       }
       let temp = arr[min_index_so_far];
        arr[min_index_so_far] = arr[i];
        arr[i] = temp;
   }
   return arr;
}



//optimised selection sort variant with less number of constraints
//This is exactly like the above algorithm, but instead of swapping one minimum value each and everytime, performing swaps on the go.

function improved_selection_sort(arr: [u32; 10]) -> [u32; 10] {
   for i in 0..9{
       for j in i+1..10{
           if(arr[j] < arr[i]){
             let temp = arr[j];
             arr[j] = arr[i];
             arr[i] = temp;
           }
       }
   }
   return arr;
}



//This variant uses n(total size of an array)/2 iterations, more efficient than the above two,  but constraints are high due to more operations involving in finding the minimum and maximum values at the same time

function efficient_selection_sort(arr: [u32; 10]) -> [u32; 10] {
const iterative_limit = 5u32; //This number should be the floor value of (array_size/2)
for i in 0..iterative_limit{
    let min_so_far = arr[i];
    let max_so_far = arr[i];
    let min_index = i;
    let max_index = i;
    const j = 9u32-i;
    for k in i..j+1{
        // getting the index of maximum value from the subarray
        if(arr[k] > max_so_far){
            max_index = k;
            max_so_far = arr[k];
        }
        // getting the index of minimum value from the subarray
        else if (arr[k] < min_so_far){
            min_so_far = arr[k];
            min_index = k;
        }
    }
    //performing direct swap for arranging the minimum element in correct place
    let temp = arr[i];
    arr[i] = arr[min_index];
    arr[min_index] = temp;

    //There might be a chance that previous minimum value swap contains the maximum value, so it's better to perform this comparison before proceeding with the maximum value swap
    if (arr[min_index] >= max_so_far){
        temp = arr[j];
        arr[j] = arr[min_index];
        arr[min_index] = temp;
    }
    else{
        temp = arr[j];
        arr[j] = arr[max_index];
        arr[max_index] = temp;
    }
}
return arr;
}


//INSERTION_SORT

//This can be considered as a mix of insertion sort and bubble sort, because it does few adjacent swaps based on the inputs.

function insertion_sort(arr: [u32; 10]) -> [u32; 10] {
   for i in 1..10{
       for j in 0..i{
           if(arr[j] > arr[i]){
              let temp = arr[i];
              arr[i] = arr[j];
              arr[j] = temp;
           }
       }
   }
   return arr;
}


//TESTS

@test
function test_s1_selection_sort() {
    let s1_unsorted: [u32; 10]
        = [34u32, 52u32, 999999u32, 84u32, 215u32, 102u32, 888u32, 9292u32, 50482u32, 954u32];
    let s1_expected: [u32; 10]
        = [34u32, 52u32, 84u32, 102u32, 215u32, 888u32, 954u32, 9292u32, 50482u32, 999999u32];

    let resultSelected = selection_sort(s1_unsorted);
    console.log("Result is: {}", resultSelected);
    console.assert(resultSelected == s1_expected);
}


@test
function test_s2_selection_sort() {
    let s2_unsorted: [u32; 10]
        = [34u32, 52u32, 999999u32, 84u32, 215u32, 102u32, 888u32, 9292u32, 50482u32, 954u32];
    let s2_expected: [u32; 10]
        = [34u32, 52u32, 84u32, 102u32, 215u32, 888u32, 954u32, 9292u32, 50482u32, 999999u32];

    let resultSelected = improved_selection_sort(s2_unsorted);
    console.log("Result is: {}", resultSelected);
    console.assert(resultSelected == s2_expected);
}

@test
function test_s3_selection_sort() {
    let s3_unsorted: [u32; 10]
        = [34u32, 52u32, 999999u32, 84u32, 215u32, 102u32, 888u32, 9292u32, 50482u32, 954u32];
    let s3_expected: [u32; 10]
        = [34u32, 52u32, 84u32, 102u32, 215u32, 888u32, 954u32, 9292u32, 50482u32, 999999u32];

    let resultSelected = efficient_selection_sort(s3_unsorted);
    console.log("Result is: {}", resultSelected);
    console.assert(resultSelected == s3_expected);
}


@test
function test_insertion_sort() {
    let insertion_unsorted: [u32; 10]
        = [34u32, 52u32, 999999u32, 84u32, 215u32, 102u32, 888u32, 9292u32, 50482u32, 954u32];
    let insertion_expected: [u32; 10]
        = [34u32, 52u32, 84u32, 102u32, 215u32, 888u32, 954u32, 9292u32, 50482u32, 999999u32];

    let resultSelected = insertion_sort(insertion_unsorted);
    console.log("Result is: {}", resultSelected);
    console.assert(resultSelected == insertion_expected);
}
