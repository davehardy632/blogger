require 'rails_helper'

describe "Tags can be deleted" do
  describe "displays a delete button on tag show page" do
    it "click on delete and tag is removed and redirected to tags page" do
      article = Article.create!(title: "Very Interesting Article", body: "Even more interesting body of such article")
      tag = article.tags.create!(name: "Sports")

      visit tag_path(tag)
      click_on "Delete"

      expect(current_path).to eq(tags_path)
      expect(page).to_not have_content(tag.name)
    end
  end
end
