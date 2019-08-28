require "net/http"
require "uri"
require "json"

class Gallery < ActiveRecord::Base
    has_many :photos

    def collect_photos
        request = URI("https://pixabay.com/api/?key=#{ENV["PIXABAY_API_KEY"]}&q=#{@keywords}&image_type=photo")
        response = Net::HTTP.get_response(request)
        results = JSON.parse(response.body)
        puts "GOT FROM PIXABAY"
        puts results["hits"].count
        unless results["hits"].empty?
            results["hits"].each do |hit|
                url = hit["webformatURL"]
                likes = hit["likes"]
                user = hit["user"]
                avatar = hit["userImageURL"]
                photographer = Photographer.create(name: user, avatar: avatar)
                photo = Photo.create(url: url, photographer_id: photographer.id, likes: likes, gallery_id: @id)
            end
        end
    end
end



class Photo < ActiveRecord::Base
    belongs_to :gallery
    belongs_to :photographer
end



class Photographer < ActiveRecord::Base
    has_many :photos
end