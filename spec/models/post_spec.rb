require "spec_helper"

describe Post do

  describe ".publish!" do

    before do
      @post = Post.new
    end

    it "sets published_at" do
      @post.publish!
      @post.published_at.should be_present
    end

    it "saves the post" do
      @post.should_receive(:save)
      @post.publish!
    end

    it "sets status to 'published'" do
      @post.publish!
      @post.status.should == "published"
    end

  end

  describe "validations" do

    it "require a title" do
      post = Post.new
      post.should_not be_valid
      post.errors.keys.should include(:title)
    end

    it "require a body" do
      post = Post.new
      post.should_not be_valid
      post.errors.keys.should include(:body)
    end

    it "require a status" do
      post = Post.new
      post.should_not be_valid
      post.errors.keys.should include(:status)
    end

    it "require a author_id" do
      post = Post.new
      post.should_not be_valid
      post.errors.keys.should include(:author_id)
    end

  end

end
