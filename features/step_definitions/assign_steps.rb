Given(/^this is a new judge$/) do
    Judge.create!
end

Given(/^there are (\d+) posters in the database$/) do |arg1|
   	arg1.to_i.times do
		Poster.create!
	end
end

When(/^I click on the "(.*?)" button$/) do |arg1|
    click_button arg1
end

Then(/^there should be a judge named "(.*?)" with (\d+) assigned posters$/) do |arg1, arg2|
	@judge = Judge.where(name: arg1).first
	@judge.posters.count.should equal(arg2)
	@judge.scores.count.should equal(arg2)
end

When(/^I fill in Name with "(.*?)"$/) do |arg1|
	  fill_in 'name', with: arg1
end

When(/^I fill in Company Name with "(.*?)"$/) do |arg1|
	  fill_in 'company', with: arg1
end	
