require 'rails_helper'

describe "As a visitor" do
  describe "when I visit /authors" do
    it "I can click the title and see article show page" do
      article = Article.create!(title: "Article Title", body: "This is the body of the article where you can write all of the content")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
