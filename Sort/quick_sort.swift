// QUICK SORT

/* Algorithem
 
 quick sort algo
 1. Take a pivot element usually at the end of array.
 2. Take a pIndex starting element of an array.
 3. check if A[i] <= pivot.
 4. if yes then swap A[i] with A[pIndex] and increment pIndex by 1.
 5  else just leave it.
 6. run steps 3,4,5 from start to end - 1.
 7. swap A[pIndex] with A[end] at the end of program.
 8. partition the program into two and repeat the steps untill start < end.
 
 */

func quickSort(Array:[Int],start:Int,end:Int) -> [Int]{
    var array = Array
    
    // Break Condition : start < end 
    guard start < end else{return array}
    
    let pivot = array[end]
    var pIndex = start
  
    for i in start...(end - 1){
        if array[i] <= pivot{
            array = swap(array,i,pIndex)
            pIndex += 1
        }
    }
    
    array = swap(array,pIndex,end)
    
    array = quickSort(Array: array, start: start, end: pIndex - 1)
    array = quickSort(Array: array, start: pIndex + 1, end: end)
    
    return array
}


func swap(_ Array:[Int],_ A:Int,_ B:Int)->[Int]{
    var Array = Array
    if A == B {return Array}
    let temp = Array[A]
    Array[A] = Array[B]
    Array[B] = temp
    return Array
}
