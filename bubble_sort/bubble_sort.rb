def bubble_sort! (array)
    n = array.size
    loop do
        swapped = false
        (n - 1).times do |i|
            if array[i] > array[i + 1]
                array[i], array[i + 1] = array[i + 1], array[i]
                swapped = true
            end
        end
        break if swapped == false
    end
    array
end

def bubble_sort_by! (array)

    if !block_given?
        puts "Error: No comparison given."
        return []
    end
    n = array.size
    loop do
        swapped = false
        (n - 1).times do |i|
            if yield(array[i], array[i + 1]) > 0
                array[i], array[i + 1] = array[i + 1], array[i]
                swapped = true
            end
        end
        break if swapped == false
    end
    array
end

arr = [3, 6, 5, 4, 8]
bubble_sort!(arr)
puts arr

arr2 = ["hi","hello","hey"]
bubble_sort_by!(arr2)
puts arr2