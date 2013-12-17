class Name < ActiveRecord::Base

	def format_data(hash, request)
		self.given_name = request
		self.interpretation = hash[:pods]["Input interpretation"].pop
		self.us_births = hash[:pods]["Information for US births"].pop
		self.us_population_alive = hash[:pods]["Estimates for current US population"].pop
		self.alternative_names = hash[:pods]["Alternate versions"].pop
		self.etymology = hash[:pods]["Etymology"].pop
	end

end

