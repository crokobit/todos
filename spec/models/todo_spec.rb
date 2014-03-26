require 'spec_helper'

describe Todo do
  describe "shoulda-matcher"  do
  end
  describe "#display_tags" do
    let(:todo) {Fabricate(:todo)}
    it "displays the name when there is no tags" do
      expect(todo.display_text).to eq "grammer"
    end
    it "displays with word tag when there has only single tag" do
      tag1 = Tag.create(name: "tag1") 
      todo.tags << tag1
      expect(todo.display_text).to eq "grammer (tag: tag1)"
    end
    it "display mutiple tags when less than four tags" do
      tag1 = Tag.create(name: "tag1") 
      tag2 = Tag.create(name: "tag2") 
      todo.tags << tag1
      todo.tags << tag2
      expect(todo.display_text).to eq "grammer (tags: tag1, tag2)"
    end
    it "display when more than four tag using more ..." do
      tag1 = Tag.create(name: "tag1") 
      tag2 = Tag.create(name: "tag2") 
      tag3 = Tag.create(name: "tag3") 
      tag4 = Tag.create(name: "tag4") 
      tag5 = Tag.create(name: "tag5") 
      tag6 = Tag.create(name: "tag6") 
      todo.tags << tag1
      todo.tags << tag2
      todo.tags << tag3
      todo.tags << tag4
      todo.tags << tag5
      todo.tags << tag6
      expect(todo.display_text).to eq "grammer (tags: tag1, tag2, tag3, tag4, more...)"
    end
  end
end
