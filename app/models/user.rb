require 'autoinc'

class User
  include Mongoid::Document
  include Mongoid::Autoinc
  
  index(search_field: 'text' )

  field :firstName, type: String
  field :lastName, type: String
  field :email, type: String


  increments :id
  
end
