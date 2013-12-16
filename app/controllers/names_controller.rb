class NamesController < ApplicationController
	def new
		@name = Name.new
	end

	def create
		request = params[:name][:given_name]
		result = Wolfram.fetch(request + " given name") 
		ap result
	end

end