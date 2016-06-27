require 'sinatra'
require_relative 'lib/cipher'
require 'sinatra/reloader' if development?

cipher = Cipher.new

get "/" do
	input = params["input"]
	key = params["key"].to_i
	message = cipher.encrypt(input, key)
	erb :index, locals: {message: message, input: input, key: key}
end