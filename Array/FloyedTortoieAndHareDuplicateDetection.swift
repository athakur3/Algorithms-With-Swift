/* Floyed tortoie and Hare Cycle Detection
 
 Contraint:
 Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one
 
 Example 1:

 Input: [1,3,4,2,2]
 Output: 2
 
 
 Example 2:
 Input: [3,1,3,4,2]
 Output: 3
 
 
 Note:
 You must not modify the array (assume the array is read only).
 You must use only constant, O(1) extra space.
 Your runtime complexity should be less than O(n2).
 There is only one duplicate number in the array, but it could be repeated more than once.
 
 
 Algo
  1. Create two pointers slow pointer and fast pointer
  2. slow pointer will take one step i.e num[slowPointer]
  3. fast pointer will take two steps i.e num[num[fast pointer]]
  4. check for the interceptor point where slowPointer == fastPointer
 
  5. we will try to find the entry point
  6. we will take pointer1 at index 0
  7. we will take pointer2 at slowpointer
  6. now we will move pointer1 at num[pointer1]
  7. pointer2 at num[pointer2]
  8. check if pointer1 == pointer2
  9. if both values are equal that becomes the entry point and is the duplicate value
 
 complexity
 1. it takes only constant O(1) extra space
 2. time complexity = O(n)
 */

func findDuplicate(num:[Int])->Int{
    // slow pointer moves 1 step i.e num[slowPointer]
    var slowPointer = num[0]
    // fast pointer moves 2 steps i.e num[num[fastPointer]]
    var fastPointer = num[0]
   
    
    while (true){
        slowPointer = num[slowPointer]
        fastPointer = num[num[fastPointer]]
        
        // Check for condition when both have equal values and breaks the loop
        if (slowPointer==fastPointer){break}
    }
    
    // find entry Point
    var pointer1 = num[0]
    // sets to slow pointer
    var pointer2 = slowPointer
    
    // both moves one step until they both have equal values
    while(pointer1 != pointer2){
        pointer1 = num[pointer1]
        pointer2 = num[pointer2]
    }
    
    // returns the duplicate value
    return pointer1
}

findDuplicate(num: [1,3,4,2,2])
