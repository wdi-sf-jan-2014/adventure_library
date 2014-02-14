class Library < ActiveRecord::Base
	def change
		create_table :libraries do |t|
			t.string :url

			t.timestamps
		end
	end
end
