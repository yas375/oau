class Sample < ActiveRecord::Base
  attr_accessible :n, :c, :p1, :p2, :step, :aql, :ltpd

  validates_presence_of :n, :c, :p1, :p2, :step, :aql, :ltpd

  validates_numericality_of :p1, :p2, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1
  validates_numericality_of :step, :greater_than => 0, :less_than_or_equal_to => 1
  validates_numericality_of :n, :only_integer => :true, :greater_than => 0
  validates_numericality_of :c, :only_integer => :true, :greater_than_or_equal_to => 0

  validates_inclusion_of :aql, :ltpd, :in => 0..100

  def probability(r, p)
    [].tap do |s|
      s << factorial(self.n)/(factorial(self.n - r)*factorial(r))
      s << p ** r
      s << (1 - p) ** (self.n - r)
    end.inject(:*)
  end

  def false_rejection
    prop_sum = 0
    (self.c + 1).times do |r|
      prop_sum += self.probability(r, self.aql/100)
    end
    1 - prop_sum
  end

  def false_acceptance
    prop_sum = 0
    (self.c + 1).times do |r|
      prop_sum += self.probability(r, self.ltpd/100)
    end
    prop_sum
  end

  def factorial(value)
    (1..value).inject(:*) || 1
  end
end
