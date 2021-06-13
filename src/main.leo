function main(unsorted: [u32; 10]) -> [u32; 10]{
    return insertion_sort(unsorted);
}

function bubble_sort(arr: [u32; 10]) -> [u32; 10] {
   for i in 0..9{
       for j in 0..9-i{
           if(arr[j+1] < arr[j])
           {
               let temp = arr[j+1];
               arr[j+1] = arr[j];
               arr[j] = temp;
           }
       }
   }
   return arr;
}

//selection sort method is to arrange the left side elements(min-elements) first
//improved selection sort variant with less no of constraints
function selection_sort(arr: [u32; 10]) -> [u32; 10] {
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



//actual selection sort algorithm but with more no.of constraints
function improved_selection_sort(arr: [u32; 10]) -> [u32; 10] {
   for i in 0..9{
       let min_index_so_far = i;
       for j in i+1..10{
           //console.log("i {}, j {}",i,j);
           if(arr[j] < arr[min_index_so_far]){
             min_index_so_far = j;
           }
       }
       let temp = arr[min_index_so_far];
        arr[min_index_so_far] = arr[i];
        arr[i] = temp;
   }
   return arr;
}


function two_sides_selection(arr: [u32; 10]) -> [u32; 10] {
const iterative_limit = 5u32; //This number should be the floor value of (array_size/2)
for i in 0..iterative_limit{
    let min_so_far = arr[i];
    let max_so_far = arr[i];
    let min_index = i;
    let max_index = i;
    const j = 9u32-i;
    for k in i..j+1{
        if(arr[k] > max_so_far){
            max_index = k;
            max_so_far = arr[k];
        }
        else if (arr[k] < min_so_far){
            min_so_far = arr[k];
            min_index = k;
        }
    }
    let temp = arr[i];
    arr[i] = arr[min_index];
    arr[min_index] = temp;
    if (arr[min_index] == max_so_far){
        temp = arr[j];
        console.log("SecondMostIndex {}",j);
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


//======================================================================================
//INSERTION_SORT


function insertion_sort(arr: [u32; 10]) -> [u32; 10] {
   for i in 1..10{
       for j in 0..i{
      // console.log("i {}, j {}, value {}",i,j,arr[j]);
           if(arr[j] > arr[i]){
              let temp = arr[i];
               arr[i] = arr[j];
               arr[j] = temp;
           }
       }
   }
   return arr;
}

/*
function insertion_sort_2(arr: [u32; 10]) -> [u32; 10] {
   for i in 1..9{
       let val = arr[i];
       let hole = i;
       for j in 0..i{
           if(arr[j] > val){
              arr[j] = arr[j];
           }
       }
   }
   return arr;
}
*/

@test
function test_selection_sort() {
    let selection_unsorted: [u32; 10]
        = [34u32, 52u32, 999999u32, 84u32, 215u32, 102u32, 888u32, 9292u32, 50482u32, 954u32];
    let selection_expected: [u32; 10]
        = [34u32, 52u32, 84u32, 102u32, 215u32, 888u32, 954u32, 9292u32, 50482u32, 999999u32];

    let resultSelected = selection_sort(selection_unsorted);
    console.log("Result is: {}", resultSelected);
    console.assert(resultSelected == selection_expected);
}


@test
function test_improved_selection_sort() {
    let selection_unsorted: [u32; 10]
        = [34u32, 52u32, 999999u32, 84u32, 215u32, 102u32, 888u32, 9292u32, 50482u32, 954u32];
    let selection_expected: [u32; 10]
        = [34u32, 52u32, 84u32, 102u32, 215u32, 888u32, 954u32, 9292u32, 50482u32, 999999u32];

    let resultSelected = improved_selection_sort(selection_unsorted);
    console.log("Result is: {}", resultSelected);
    console.assert(resultSelected == selection_expected);
}

@test
function test_second_selection() {
    let selection_unsorted: [u32; 10]
        = [34u32, 52u32, 999999u32, 84u32, 215u32, 102u32, 888u32, 9292u32, 50482u32, 954u32];
    let selection_expected: [u32; 10]
        = [34u32, 52u32, 84u32, 102u32, 215u32, 888u32, 954u32, 9292u32, 50482u32, 999999u32];

    let resultSelected = two_sides_selection(selection_unsorted);
    console.log("Result is: {}", resultSelected);
    console.assert(resultSelected == selection_expected);
}


@test
function test_insertion_sort() {
    let insertion_unsorted: [u32; 10]
        = [8u32, 2u32, 4u32, 3u32, 5u32, 10u32, 7u32, 9u32, 6u32, 1u32];
    let insertion_expected: [u32; 10]
        = [1u32, 2u32, 3u32, 4u32, 5u32, 6u32, 7u32, 8u32, 9u32, 10u32];

    let resultSelected = insertion_sort(insertion_unsorted);
    console.log("Result is: {}", resultSelected);
    console.assert(resultSelected == insertion_expected);
}

/*
@test
function test_insertion_sort_second() {
    let insertion_unsorted_sec: [u32; 10]
        = [8u32, 2u32, 4u32, 3u32, 5u32, 10u32, 7u32, 9u32, 6u32, 1u32];
    let insertion_expected_sec: [u32; 10]
        = [1u32, 2u32, 3u32, 4u32, 5u32, 6u32, 7u32, 8u32, 9u32, 10u32];

    let resultSelected = insertion_sort_2(insertion_unsorted_sec);
    console.log("Result is: {}", resultSelected);
    console.assert(resultSelected == insertion_expected_sec);
}*/
