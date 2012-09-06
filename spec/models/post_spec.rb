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

  describe ".published?" do

    before do
      @post = Post.new(status: "draft")
    end

    it "returns true when the post is published" do
      @post.status = "published"
      @post.should be_published
    end

    it "returns false when the post is not published" do
      @post.should_not be_published
    end

  end

  describe "validations" do

    before do
      @post = Post.new(title: "foo", body: "bar", status: "published", author_id: 1)
    end

    it "base post should be valid" do
      @post.should be_valid
    end

    [:title, :body, :status, :author_id].each do |field|
      it "requires a #{field}" do
        @post.send("#{field}=".to_sym, nil)
        @post.should_not be_valid
        @post.errors.keys.should include(field)
      end
    end

  end

end
