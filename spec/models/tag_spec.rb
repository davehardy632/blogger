require 'rails_helper'

describe Tag, type: :model do
  describe "relationships" do
    it {should have_many(:taggings)}
    it {should have_many(:articles).through(:taggings)}
  end
  describe "instance methods" do
    it "should turn call name on tag objects" do
      article = Article.create(title: "Tall Tables", body: "They are tough for the short legged")
      tag_1 = article.tags.create(name: "furniture")
      tag_2 = article.tags.create(name: "opinions")

      expect(article.tag_list).to eq("furniture, opinions")
      expect(tag_1.to_s).to eq(tag_1.name)
      expect(tag_2.to_s).to eq(tag_2.name)
    end
  end
end
