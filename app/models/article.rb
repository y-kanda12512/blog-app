# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
    has_one_attached :eyecatch
    has_rich_text :content
    validates :title, presence: true
    validates :title, length: { minimum: 2 ,maximum: 100}
    validates :title, format: { with: /\A(?!\@)/ }

    # length
    validates :content, presence: true
    # validates :content, length: { minimum: 10 }
    # validates :content, uniqueness: true

    # validate :varidate_title_and_content_length

    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user

    # private
    # def varidate_title_and_content_length
    #     char_count = self.title.length + self.content.length
    #     unless char_count > 100
    #         errors.add(:content,'100文字以上でお願いします')
    #     end
    # end
end
