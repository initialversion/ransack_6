class Actor < ApplicationRecord
  # Direct associations

  has_many   :castings,
             :dependent => :destroy

  # Indirect associations

  has_many   :filmography,
             :through => :castings,
             :source => :movie

  # Validations

end
