class StringCalculator
  def add(numbers)
    return 0 if numbers.strip.empty?

    default_delimiters = /,|\n/ # Default delimiter
    number_strings = numbers.split(/#{default_delimiters}/).map(&:strip)
    number_strings.map(&:to_i).sum
  end
end
