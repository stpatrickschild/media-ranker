require "test_helper"

describe Work do
  describe 'validations' do
    before do
      # Arrange
      
      @work = Work.new(
        category: "book",
        title: 'a new book',
        creator: 'booker',
        publication_year: 1989,
        description: 'viral hemorrhagic fevers'
      )
    end

    it 'works when all fields are present' do
      # Act
      result = @work.valid?

      # Assert
      expect(result).must_equal true
    end

    it 'needs a title' do
      # Arrange
      @work.title = nil
    
      # Act
      result = @work.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@work.errors.messages).must_include :title
      expect(@work.errors.messages[:title]).must_include "should not be blank"
    end

    it 'fails validation when the title alreadt exists' do
      Work.create(title: @work.title)
      expect(@work.valid?).must_equal false
      expect(@work.errors.messages).must_include :title
      expect(@work.errors.messages[:title]).must_include "already taken"
    end
  end

  describe "custom methods" do
    describe "top works" do
      it "can pick max ten top works w/catagory" do
      end
    end

    describe "spotlight" do
      it "can pick the work with maximum votes" do
      end
      it "when tied with votes, it picks the most recent" do
      end
    end
  end
end
