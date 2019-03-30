require "rails_helper"

describe "user edits an article" do
  describe "they link from the show page" do
    describe "they fill in an edit field" do
      it "submit displays updated info on show page" do
        article = Article.create!(title: "Camping Article", body: "This article is about camping")

        visit article_path(article)
        click_link "Edit"
        expect(current_path).to eq(edit_article_path(article))
        new_title = "Edited Title"
        fill_in "article[title]", with: new_title
        fill_in "article[body]", with: "Edited body of article"
        click_on "Update Article"

        expect(page).to have_content("Edited Title")
        expect(page).to have_content("Edited body of article")
      end
    end
  end
end
# require 'rails_helper'
#
# describe 'As a visitor, when I go to /articles' do
#   describe 'I see a link to make a new article' do
#     describe 'They can fill in a form for a new article' do
#       it 'creates a new article' do
#
#         visit articles_path
#         click_link "Create a New Article"
#
#         expect(current_path).to eq(new_article_path)
#
#         fill_in "article[title]", with: "New Title!"
#         fill_in "article[body]", with: "New Body!"
#         click_on "Create Article"
#
#         expect(page).to have_content("New Title!")
#         expect(page).to have_content("New Body!")
#       end
#     end
#   end
# end
