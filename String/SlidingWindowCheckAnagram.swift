//
/* +++++++++++++++++++++++sliding window++++++++++++*/
// first string XYYZXZYZXXYZ
// SECOND string XYZ
// find the number of anagram in strings in the string

func findNumberOfAnagrams(a: String, b: String) -> Int {
    var window = [Character]()
    let set: Set = Set(b)
    var n = 0
    
    for (i,val) in a.enumerated(){
        
        if i < b.count{
            // fill the window till the index of set lenght
            window.append(val)
        }else{
            let windowSet = Set(window)
            // check if window is subset of the finding string
            if set.isSubset(of: windowSet){
                // update the score if yes
                n += 1
            }
            
            //update the window remove first and append at last.
            window.removeFirst()
            window.append(val)
        }
    }
    
    // check if window is subset of the finding string
    let windowSet = Set(window)
    if set.isSubset(of: windowSet){
        // update the score if yes
        n += 1
    }
    
    return n
}

let anaGramsCount = findNumberOfAnagrams(a: "XYYZXZYZXXYZYYZXXZY",b:"XYZ")
print("number of anagrams count is \(anaGramsCount)")
