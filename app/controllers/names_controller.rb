class NamesController < ApplicationController


	def new
		@name = Name.new
	end

	def create
		 request = params[:name][:given_name] 
	 @name = Name.where(given_name: request).pop
	  if @name == nil 
		  result = Wolfram.fetch(request + " given name") 
		  hash = Wolfram::HashPresenter.new(result).to_hash
		  ap hash
		  @name = Name.new
		  @name.format_data(hash, request)
		  @name.save!
		  ap @name
		end
	  redirect_to name_path(@name.id)
	end

	def show
		@name = Name.find(params[:id])
	end
	
end
