require 'rails_helper'

describe 'As a visitor, when I go to /articles' do
  describe 'I see a link to make a new article' do
    describe 'They can fill in a form for a new article' do
      it 'creates a new article' do

        visit articles_path
        click_link "Create a New Article"

        expect(current_path).to eq(new_article_path)

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]", with: "New Body!"
        fill_in "article[tag_list]", with: "ruby, technology"
        click_on "Create Article"

        expect(page).to have_content("ruby")
        expect(page).to have_content("technology")
        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
        expect(page).to have_content("Article New Title! Created Successfully")
      end
    end
  end
end
