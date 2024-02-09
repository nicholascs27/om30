class Municipe < ApplicationRecord
  self.table_name = :municipes

  include MunicipeValidations

  has_many :municipe_addresses, class_name: 'MunicipeAddress'
end
