require "test_helper"

describe Movie do
  let(:movie) { Movie.new }

  describe "validations and instantiation" do 
    it "won't be valid without title and inventory" do
      expect(movie).wont_be :valid?

      # for title
      expect(movie.errors.messages).must_include :title
      expect(movie.errors.messages[:title]).must_equal ["can't be blank"]
      
      # for inventory
      expect(movie.errors.messages).must_include :inventory
      expect(movie.errors.messages[:inventory]).must_equal ["can't be blank"]
    end

    it "will be valid with title and inventory" do 
      movie.update_attributes({ title: "Test movie", inventory: 5 })

      expect(movie).must_be :valid?
      expect(movie.errors.messages).must_be_empty
    end

    it "responds to its fields" do 
      ["title", "overview", "release_date", "inventory"].each do |field|
        expect(movie).must_respond_to field
      end
    end
  end

  describe "relationships" do 
    it "" do 

    end
  end
  
  describe "custom methods" do 
  end
end
