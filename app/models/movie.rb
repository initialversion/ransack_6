class Movie < ActiveRecord::Base
  # Direct associations

  has_many   :castings,
             :dependent => :destroy

  belongs_to :director

  # Indirect associations

  has_many   :cast,
             :through => :castings,
             :source => :actor

  # Validations

end
