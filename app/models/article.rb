class Article < ApplicationRecord
  has_and_belongs_to_many :tags
  belongs_to :tag, optional: true

  attribute :active, default: false
  
  #* AVATAR
  has_one_attached :avatar
    
  #* RANSACK (SEARCH)
  def self.ransackable_attributes(auth_object = nil)
      ['title', 'content']
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  #* COMMENTS
  has_many :comments, dependent: :destroy
end
