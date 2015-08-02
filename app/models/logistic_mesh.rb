class LogisticMesh < ActiveRecord::Base
  validates_presence_of :origin, :destination
  validates_numericality_of :distance
  validates_uniqueness_of :distance, scope: [:origin, :destination]
end
