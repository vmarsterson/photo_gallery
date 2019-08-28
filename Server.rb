require "sinatra"
require "sinatra/activerecord"
require_relative "./lib/photo_gallery.rb"

class Server < Sinatra::Base
    get '/' do
        erb :index, locals: {galleries: Gallery.all}
    end
end