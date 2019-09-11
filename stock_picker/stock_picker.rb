def stock_picker(prices)
    min_element_index = 0
    min_diff_index = 0
    max_diff_index = -1
    max_diff = 0
    prices.each_index do |i|
        if !prices[i].is_a?(Numeric)
            puts "Error: Prices array should only contain numbers."
            return nil
        end

        if prices[i] - prices[min_element_index] > max_diff
            max_diff = prices[i] - prices[min_element_index]
            max_diff_index = i
            min_diff_index = min_element_index
        end

        if prices[min_element_index] > prices[i]
            min_element_index = i
        end
    end

    return [].push(min_diff_index).push(max_diff_index)
end

puts stock_picker([17,3,6,9,15,8,6,1,10])