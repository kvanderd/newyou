class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
    	t.string :given_name
    	t.string :interpretation
  		t.text :us_births
      t.text :named_per_year
      t.text :us_birth_percentage
      t.text :us_population_alive
      t.text :most_commone_age
      t.text :notable_people
      t.text :etymology
      t.timestamps
    end
  end
end
