require 'rails_helper'

describe "When I visit article show page" do
  describe "I see links on all of the tag names" do
    it "click on the tag and taken to tag show page" do
      article = Article.create!(title: "Badass new article", body: "Body of the badass new article, which I highly recommend")
      tag = article.tags.create!(name: "Name")

      visit article_path(article)
      click_link tag.name

      expect(current_path).to eq(tag_path(tag))
      expect(page).to have_content(tag.name)
      expect(page).to have_content(article.title)
    end
  end
end
