/* ++++++++++++++MERGE SORT ++++++++++++
 
 psudo code
 
 mergeSort(Array)-> Array{
 
1. length = array.count - 1 // find length of array
 
2. guard length > 0 else{return a} // compare if lenght is greater then 0
 
3. mid = lenght/2 // find mid
 
4. leftArray = Array[0...mid] // divide array into left and right
 
5. rightArray = Array[mid+1 ... length] // right array
 
6. let sortedLeft = mergeSort(leftArray)

7. let sortedRight = mergeSort(rightArray) call recursive sort on left and right
 
8. A = merge(left , right , newArray) merger left and right into new array
 
9. return sorted Array
 }
 
 merge(left,right,Array){
 
 1. leftlenght = left.count // find count of lenght ... if u intend to use <= operator then find left.count - 1 lenght else simply us it
 
 2. rightLenght = right.count  // smilarly
 
 3. var A = Array
 
 4. i,j,k = 0
 
 5. while (i < leftLength && j < rightLenght){
 
 if left[i] <= right[j]{ // compare values
    A[k] = left[i] // put in A which ever is lowest and move that array count
    i++
 }else{
    A[k] = right[j]
    j++
 }
 
 k++
 }
 
 6. while (i< leftLenght){
    A[k] = left[i]  // add all left over cases
    i++
    k++
 }
 
 7. while (j < rightLenght){
    A[k] = right[j]
    j++
    k++
 }
 
    return A
 }
 
 */


// merger sort

func mergeSort(A:[Int])->[Int]{
    let len = A.count - 1
    
    guard len > 0 else{return A}
    
    let mid = len/2
    let leftArray = Array(A[0...mid])
    let rightArray = Array(A[(mid+1)...len])
    
    let sortedLeft = mergeSort(A:leftArray)
    let sortedRight = mergeSort(A: rightArray)
    
    let sortedArray = merge(left:sortedLeft,right:sortedRight,Array: A)
    
    return sortedArray
}

func merge(left:[Int],right:[Int],Array:[Int])->[Int]{
    var A = Array
    let leftCount = left.count
    let rightCount = right.count
    var i=0,j=0,k=0
    
    while(i < leftCount && j < rightCount){
        
        if left[i] <= right[j]{
            A[k] = left[i]
            i += 1
        }else{
            A[k] = right[j]
            j += 1
        }
        
        k += 1
    }
    
    while(i < leftCount){
        A[k] = left[i]
        k += 1
        i += 1
    }
    
    while(j < rightCount){
        A[k] = right[j]
        k += 1
        j += 1
    }
    
    return A
}
