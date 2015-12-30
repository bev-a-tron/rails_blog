class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
            length: { minimum: 5 }

  after_create :do_this

  def do_this
    puts 'doing this extra thing!'
  end

end
