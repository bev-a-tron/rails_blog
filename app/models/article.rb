class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :title, presence: true,
                    length: { minimum: 5 }

  before_create :do_this_before
  after_create :do_this

  def do_this_before
    puts 'doing this before!'
  end

  def do_this
    puts 'doing this extra thing!'
  end
end
