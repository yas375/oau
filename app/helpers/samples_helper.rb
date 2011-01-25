module SamplesHelper
  def factorial(value)
    if value == 0
      1
    else
      (1..value).inject(:*)
    end
  end

  def format_decimal(value)
    format("%.5f", value)
  end
end
