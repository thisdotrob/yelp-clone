describe Review, type: :model do
  it { is_expected.to belong_to :restaurant }

  it 'is invalid if the rating is more than 5' do
    review = Review.new(rating: 6)
    expect(review).to have(1).error_on(:rating)
    expect(review).not_to be_valid
  end
end
