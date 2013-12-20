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
		name = Name.find(params[:id])
		gon.nameInfo = name
	end

	def states
		ap params
    puts "this is the state" * 9
		ap params[:state][:name]
		@state = State.where(name: params[:state][:name])
		# gon.state = @state
		# render :partial => 'test', :object => @state
		respond_to do |format|
    # format.html { redirect_to tasks_url }
	    format.js 
	    # format.json { render :json => gon.stateInfo }
	  end
	
	end
	
end
