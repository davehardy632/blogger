require 'rails_helper'

describe "As a visitor" do
  describe "when I visit /authors" do
    it "I can click the title and see article show page" do
      article = Article.create!(title: "Article Title", body: "This is the body of the article where you can write all of the content")
      comment_1 = article.comments.create(author_name: "Me", body: "Commenty comments")
      comment_2 = article.comments.create(author_name: "You", body: "So much to say")
      visit articles_path

      click_link article.title


      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
end
