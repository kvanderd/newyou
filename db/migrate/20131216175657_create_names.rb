class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
    	t.string :given_name
    	t.string :interpretation
  		t.float :us_births
      t.integer :named_per_year
      t.float :us_birth_percentage
      t.float :us_population_alive
      t.text :most_common_age
      t.text :alternative_names
      t.text :etymology
      t.timestamps
    end
  end
end
