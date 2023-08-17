class Article < ApplicationRecord
    has_one_attached :avatar
    
    def self.ransackable_attributes(auth_object = nil)
        ['title', 'content']
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end
