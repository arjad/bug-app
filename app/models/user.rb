class User < ApplicationRecord

  has_many :userprojects, dependent: :delete_all
  has_many :bugs
  has_many :projects, through: :userprojects
  accepts_nested_attributes_for :projects

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum usertype: [ :Manager, :Developer, :SQA]

end
