example_array = [20,17,29,9,10,21,25,22]
def stock_picker(array)
  # pairs is multidimensional:
  # x-axis is the current price
  # y-axis is the profits for future prices
  pairs = Array.new(array.length) {Array.new()}
  # called pairs since it gives each possible buy/sell scenario for a pair of days
  array.each_with_index do |current_price, day|
    array.map do |day_price|
      pairs[day].push(day_price - current_price)
    end
    pairs[day].shift(day)
  end 
  most_profit = pairs.flatten.sort[-1]
  buy_sell_days = pairs.filter_map do |pair_array|
    if pair_array.include?(most_profit)
      pair_array.index(most_profit)
    end
  end
  buy_sell_days.push(array.index(array[buy_sell_days[0]] + most_profit))
  p buy_sell_days
end

stock_picker(example_array)