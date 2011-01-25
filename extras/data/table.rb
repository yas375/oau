# -*- coding: utf-8 -*-
class Data::Table
  include SamplesHelper

  def initialize(sample)
    @sample = sample
  end

  attr_reader :sample

  def header
    unless @header
      @header = Data::Header.new
      @header << Data::Cell.new('p')
      @header << Data::Cell.new('q')
      (sample.c + 1).times do |a|
        @header << Data::Cell.new("P(r=#{a})")
      end
      @header << Data::Cell.new("P(r≤1)")
    end
    @header
  end

  def rows
    unless @rows
      @rows = []
      (sample.p1..sample.p2).step(sample.step) do |p|
        row = Data::Row.new
        row << Data::Cell.new(p)
        q = 1 - p
        row << Data::Cell.new(q)
        p_priemki_partii = 0
        (sample.c + 1).times do |r|
          value = [].tap do |s|
            s << factorial(sample.n)/(factorial(sample.n - r)*factorial(r))
            s << p ** r
            s << q ** (sample.n - r)
          end.inject(:*)

          row << Data::Cell.new(format_decimal(value))
          p_priemki_partii += value
        end
        row << Data::Cell.new(format_decimal(p_priemki_partii))

        @rows << row
      end
    end
    @rows
  end
end
