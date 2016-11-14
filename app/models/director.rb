class Director < ActiveRecord::Base
  # Direct associations

  has_many   :movies,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
