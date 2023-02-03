//: [Previous](@previous)

var array = [
    58, 425, 210, 259, 113, 304, 429, 327, 183, 396, 89, 397, 262, 298, 365, 400, 460, 27, 177, 66,
    84, 130, 461, 13, 22, 333, 82, 186, 406, 347, 11, 492, 473, 211, 44, 208, 201, 294, 1, 478,
    344, 430, 288, 17, 290, 395, 300, 96, 153, 33, 258, 440, 207, 86, 91, 316, 336, 137, 166, 250,
    456, 141, 264, 442, 93, 437, 333, 338, 475, 22, 302, 78, 375, 391, 31, 372, 228, 424, 236, 94,
    146, 124, 450, 112, 416, 422, 423, 280, 88, 308, 309, 43, 441, 247, 426, 102, 302, 241, 141, 374,
    184, 454, 29, 202, 122, 500, 109, 350, 492, 133, 474, 417, 420, 179, 309, 400, 270, 260, 170, 107,
    417, 177, 138, 295, 458, 247, 192, 87, 157, 320, 74, 33, 133, 279, 2, 271, 361, 240, 104, 434,
    29, 498, 139, 126, 417, 165, 200, 435, 124, 317, 478, 153, 82, 97, 12, 271, 349, 69, 458, 50,
    311, 299, 460, 359, 113, 487, 90, 391, 362, 21, 360, 309, 444, 371, 188, 301, 40, 126, 33, 281,
    32, 339, 359, 20, 499, 196, 2, 106, 17, 226, 367, 428, 223, 136, 30, 90, 469, 227, 207, 127
]

/**
 * Runtime: O(n log(n))
 * Space: O(n)
 */
func mergeSort(_ array: inout [Int]) -> [Int] {
    var helper = Array(repeating: 0, count: array.count)
    mergeSort(&array, &helper, 0, array.count - 1)
    return array
}

func mergeSort(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ high: Int) {
    if low < high {
        var middle = (low + high) / 2
        mergeSort(&array, &helper, low, middle) // Sort left half
        mergeSort(&array, &helper, middle + 1, high) // Sort right half
        merge(&array, &helper, low, middle, high) // Merge them
    }
}

func merge(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ middle: Int, _ high: Int) {
    /* Copy both halves into a helper array */
    for i in low...high {
        helper[i] = array[i]
    }

    var helperLeft = low
    var helperRight = middle + 1
    var current = low

    // Iterate through helper array. Compare the left and right hallf, copying back the smaller element from the two galves into the original array.
    while helperLeft <= middle && helperRight <= high {
        if helper[helperLeft] <= helper[helperRight] {
            array[current] = helper[helperLeft]
            helperLeft += 1
        } else {
            array[current] = helper[helperRight]
            helperRight += 1
        }

        current += 1
    }

    // Copy the rest of the left side of the array into the target array
    var remaining = max(middle - helperLeft, 0)
    for i in 0..<remaining {
        array.swapAt(current + i, helperLeft + i)
    }
}

print(mergeSort(&array))

//: [Next](@next)
