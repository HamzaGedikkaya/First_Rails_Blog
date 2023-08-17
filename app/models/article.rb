class Article < ApplicationRecord

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
    has_many :comments
end
