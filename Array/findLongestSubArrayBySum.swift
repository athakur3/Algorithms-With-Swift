/* Find longest sub array by sum in linear time
   let sum = 10
   array = [1,2,4,3,0,0,0,0,10] longest subarray = 12340000
 
 algo used
 1. take two pointers
 2. left = start of the array
 3. right = start of the array
 4. While right < End.
 5. calculate sum += array[right]
 6. check if {sum > sum_required} => True => subtract  sum - array[left] and increment left++
 7. if {sum == sum_required} than check {right-left > stored right - stored left}
 8. store the value to return
 9. increment right and repeat steps 5 to 8
 */

func findLongestSubArray(array:[Int],s:Int)->[Int]{
    var left = 0
    var right = 0
    var subArrayStart = -1
    var subArrayEnd = -1
    var sum = 0
    
    while(right <= (array.count - 1)){
        
        sum += array[right]
        if(sum > s){
            sum = sum - array[left]
            left += 1
        }else
            if (sum == s) && ((right - left) > ((subArrayEnd) - (subArrayStart))){
            subArrayEnd = right
            subArrayStart = left
        }
        
        right += 1
    }
    
    return [subArrayStart,subArrayEnd]
}

print(findLongestSubArray(array: [1,2,4,3,0,0,0,0,10], s: 11))
