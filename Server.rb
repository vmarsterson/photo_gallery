require "sinatra"
require "sinatra/activerecord"
require_relative "./lib/photo_gallery.rb"

class Server < Sinatra::Base
    get /\/|\/galleries/ do
        erb :index, locals: {galleries: Gallery.all}
    end

    get '/galleries/new' do
        erb :create
    end

    post '/galleries' do
        title = params["title"]
        keywords = [params["keyword_1"], params["keyword_2"]].join("+")
        gallery = Gallery.new(title: title, keywords: keywords)
        gallery.collect_photos
        erb :index, locals: {galleries: Gallery.all}
    end
end