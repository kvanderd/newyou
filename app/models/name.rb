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

# {
#            :pods => {
#                        "Input interpretation" => [
#             [0] "Alex  (male given name)"
#         ],
#                   "Information for US births" => [
#             [0] "rank | 98th\nfraction | 1 in 524 people (0.19%)\nnumber | 3836 people per year \n(US data based on 2012 births and other SSA registrations in the US)"
#         ],
#                       "History for US births" => [
#             [0] ""
#         ],
#         "Estimates for current US population" => [
#             [0] "expected total number alive today | 218738 people\nexpected population fraction | 1 in 1099 people (0.091%)\nexpected rank | 246th\nmost common age | 17 years\n(using standard US mortality data)"
#         ],
#          "Estimated current age distribution" => [
#             [0] "\n(using standard US mortality data)"
#         ],
#                          "Alternate versions" => [
#             [0] "Al  |  Alec  |  Alexander  |  Ec  |  Eck  |  Eckie  |  Lex  |  Xander"
#         ],
#                   "Notable people named Alex" => [
#             [0] "Alex Pettyfer  (actor) (born 1990) (age: 23 years)\nAlex Rodriguez  (baseball player) (born 1975) (age: 38 years)\nAlex Ferguson  (soccer manager, etc.) (born 1941) (age: 71 years)\nAlex Trebek  (game show host) (born 1940) (age: 73 years)\nAlex Wolff  (drummer) (born 1997) (age: 16 years)\nAlex Lifeson  (guitarist, etc.) (born 1953) (age: 60 years)\nAlex Rocco  (actor) (born 1936) (age: 77 years)\nAlex Haley  (novelist)  (1921  to  1992)\nAlex Van Halen  (drummer, etc.) (born 1953) (age: 60 years)\nAlex Smith  (football player) (born 1984) (age: 29 years)\n..."
#         ],
#                                   "Etymology" => [
#             [0] "Short form of Alexander and other names beginning with Alex"
#         ]
#     },
#     :assumptions => {
#         "SubCategory" => [
#             [0] "Alex (male)",
#             [1] "Alex (female)"
#         ]
#     }
# }