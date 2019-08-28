class Gallery < ActiveRecord::Base
    has_many :photos
end



class Photo < ActiveRecord::Base
    belongs_to :gallery
    belongs_to :photgrapher
end



class Photographer < ActiveRecord::Base
    has_many :photos
end