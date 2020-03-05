class Professor < ApplicationRecord
  def self.ransortable_attributes(auth_object=nil)
    column_names
  end

  def self.ransackable_attributes(auth_object=nil)
    ransortable_attributes
  end
end
