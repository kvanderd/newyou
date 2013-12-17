class Name < ActiveRecord::Base

	def format_data(hash, request)
		self.given_name = request
		self.interpretation = hash[:pods]["Input interpretation"].pop
		kiss = hash[:pods]["Information for US births"].pop.match(/(\d+[,.]\d+%)/).to_s
		love = hash[:pods]["Estimates for current US population"].pop.match(/(\d+[,.]\d+%)/).to_s
		self.alternative_names = hash[:pods]["Alternate versions"].pop
		self.etymology = hash[:pods]["Etymology"].pop
		self.us_population_alive = kiss.to_f
		self.us_births = love.to_f
	end

end

