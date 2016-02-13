class Booking < ActiveRecord::Base
  belongs_to :shift
  belongs_to :editor
  belongs_to :typist
  belongs_to :reader
end
