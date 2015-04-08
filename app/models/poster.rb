class Poster < ActiveRecord::Base
	attr_accessible :number, :presenter, :title, :advisors, :score, :judges

	def self.import_csv(file)
		CSV.foreach(file.path, headers: true, encoding: 'windows-1251:utf-8') do |row|
			poster = Poster.where(number: row['number'])
			row_hash = row.to_hash
			if poster.count == 1
				poster.first.update_attributes(row_hash)
			else
				Poster.create(row_hash)
			end
		end
	end
end
