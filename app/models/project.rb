class Project < ApplicationRecord
    has_many :userprojects, dependent: :delete_all
    has_many :bugs
    has_many :users, through: :userprojects
    accepts_nested_attributes_for :bugs

     #validation here
     validates :title, :description, presence: true
     validates :title, :description, length: { minimum: 2 }
     validates :title, uniqueness: { case_sensitive: false }

end
