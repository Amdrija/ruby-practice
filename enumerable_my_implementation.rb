module Enumerable

    def my_each
        return self if !block_given?

        self.size.times do |i|
            yield(self[i])
        end
        self
    end

    def my_each_with_index
        return self if !block_given?
        
        self.size.times do |i|
            yield(self[i], i)
        end
        self
    end

    def my_select
        return self if !block_given?

        selection = []
        self.my_each do |el|
            selection.push(el) if yield(el)
        end
        selection
    end

    def my_all?
        if !block_given?
            return self.my_all? {|el| el}
        end

        self.my_each do |el|
            return false unless yield(el)
        end

        true
    end

    def my_any?
        if !block_given?
            return self.my_any? {|el| el}
        end

        self.my_each do |el|
            return true if yield(el)
        end

        false
    end

    def my_none?
        if !block_given?
            return self.none? {|el| el}
        end

        self.my_each do |el|
            return false if yield(el)
        end

        true
    end

    def my_count obj= nil
        count = 0

        if obj
            self.my_each do |el|
                count += 1 if obj == el
            end
        elsif block_given?
            self.my_each do |el|
                count += 1 if yield(el)
            end
        else
            self.my_each do |el|
            count += 1
            end
        end
        count
    end

    def my_map proc = nil, &block
        map_arr = []
        proc ||= block

        self.my_each do |el|
            map_arr.push(proc.call(el))
        end
        map_arr
    end

    def my_inject accumulator = nil
        return nil if !block_given?

        accumulator_is_first = false
        if accumulator.nil?
            accumulator = self[0]
            accumulator_is_first = true
        end

        self.my_each do |el|
            accumulator = yield(accumulator, el) unless accumulator_is_first
            accumulator_is_first = false
        end
        accumulator
    end
end

def mulyiply_els array
    array.my_inject(1){|acc, el| acc * el}
end

a_proc = Proc.new do |el|
    el * 2
end
arr = [1,7,3].my_map (a_proc) {|el| el * 3}
print arr