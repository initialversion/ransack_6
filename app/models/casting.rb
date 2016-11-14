class Casting < ActiveRecord::Base
  # Direct associations

  belongs_to :actor

  belongs_to :movie

  # Indirect associations

  # Validations

end
