class Sample < ActiveRecord::Base
  attr_accessible :n, :c, :p1, :p2, :step, :aql, :ltpd

  validates_presence_of :n, :c, :p1, :p2, :step, :aql, :ltpd

  validates_numericality_of :p1, :p2, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1
  validates_numericality_of :step, :greater_than => 0, :less_than_or_equal_to => 1
  validates_numericality_of :n, :only_integer => :true, :greater_than => 0
  validates_numericality_of :c, :only_integer => :true, :greater_than_or_equal_to => 0

  validates_inclusion_of :aql, :ltpd, :in => 0..100
end
