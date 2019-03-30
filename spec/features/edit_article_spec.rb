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
        expect(page).to have_content("Article #{new_title} Updated Successfully")
      end
    end
  end
end
