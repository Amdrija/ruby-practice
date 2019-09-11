def merge(arr1, arr2)
  result = []
  while !arr1.empty? && !arr2.empty?
    if arr1[0] < arr2[0]
      result.push(arr1.shift)
    else
      result.push(arr2.shift)
    end
  end

  while !arr1.empty?
    result.push(arr1.shift)
  end

  while !arr2.empty?
    result.push(arr2.shift)
  end

  result
end

def merge_sort(arr)
  return arr if arr.length == 1
  merge(merge_sort(arr[0..(arr.length/2 - 1)]), merge_sort(arr[(arr.length/2)..-1]))
end

print merge_sort([38,27,43,3,9,82,10])