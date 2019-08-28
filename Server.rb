require "sinatra"
require "sinatra/activerecord"

class Server < Sinatra::Base
    get '/' do
        return 'hello!'
    end
end