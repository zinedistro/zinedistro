Given /^there is some subversive shit out there$/ do
  Zine.create(:title => "Subversive Weekly")
end

When /^I engage in subversive activity$/ do
  visit "/zines"
end

Then /^I should see subversive zines$/ do
  page.should have_content "Subversive Weekly"
end

Given /^there is a lot of subversive shit out there$/ do
  Zine.create(:title => "Old Subversive Shit")
  Zine.create(:title => "New Subversive Shit")
end

Then /^the subversive shit should be ordered by date$/ do
  page.body.should =~ /New.*Old/m
end

Given /^there are many anarchists$/ do
  Author.create(:name => "Monkeyfist")
  Author.create(:name => "Anarchist Bob")
end

Given /^they author some zines$/ do
  Zine.create(:title => "Smashing Things", :authors => [Author.first, Author.last])
end

Then /^the zinarchists should get credit for being awesome$/ do
  page.should have_content "by " + Author.first.name + ", " + Author.last.name
end

Given /^there is a zine with lots of info$/ do
  Zine.create(:excerpt => "You can grow things in the garden of your mind", :full_text => "Lorem ipsum fuck your face")
end

Then /^I should see a summary$/ do
  page.should have_content Zine.first.excerpt
end

When /^I click on the first zine link$/ do
  page.first('a.zine').click
end

Then /^I should see a lot of text$/ do
  page.should have_content Zine.first.full_text
end

Given /^there is a super secret zine$/ do
  Zine.create(:title => "Super secret", :published => false)
end

Then /^I should be kept in the dark$/ do
  page.should have_no_content "Super secret"
end

When /^I try to circumvent security$/ do
  visit zine_path(Zine.first)
end

Then /^I should be punched$/ do
  page.status_code.should == 404
end

Given /^there are (\d+) authors$/ do |number_of_authors|
  number_of_authors.to_i.times { Author.create(:name => Faker::Name.name) }
end

Given /^the first author has published zines$/ do
  Zine.create(title: Faker::Lorem.sentence, authors: [Author.first], published: true)
end

Given /^the last author has unpublished zines$/ do
  Zine.create(title: Faker::Lorem.sentence, authors: [Author.last], published: false)
end

When /^I view the authors page$/ do
  visit authors_path
end

Then /^I should see the first author listed$/ do
  page.should have_content Author.first.name
end

Then /^I should not see the last author listed$/ do
  page.should have_no_content Author.last.name
end

Given /^there is an author$/ do
  step "there are 1 authors"
end

When /^I click on the first author link$/ do
  page.first('a.author').click
end

Then /^I should see the first author's zines$/ do
  Author.first.zines.each do |zine|
    page.should have_content zine.title
  end
end
