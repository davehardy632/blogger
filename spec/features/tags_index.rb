require 'rails_helper'

describe "As a visitor, when i visit /tags" do
  describe 'I see all available tags for article subjects' do
    it 'tag names are shown on the page' do
      article = Article.create!(title: "Very Interesting Article", body: "Even more interesting body of such article")
      tag = article.tags.create!(name: "Sports")
      tag_2 = article.tags.create!(name: "Health")
      tag_3 = article.tags.create!(name: "Aardvarks")
      article_2 = Article.create!(title: "All about lemons", body: "This is a long and informative articles on the health benefits of lemons")
      tag_4 = article_2.tags.create!(name: "Food")
      tag_5 = article_2.tags.create!(name: "Sour")
      tag_6 = article_2.tags.create!(name: "Yellow")

      visit tags_path

      expect(page).to have_content(tag.name)
      expect(page).to have_content(tag_2.name)
      expect(page).to have_content(tag_3.name)
      expect(page).to have_content(tag_4.name)
      expect(page).to have_content(tag_5.name)
      expect(page).to have_content(tag_6.name)
    end
  end
end
