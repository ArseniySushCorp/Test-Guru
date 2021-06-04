class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  def self.names_by_category(name)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: name })
      .order(title: :desk)
      .pluck(:title)
  end
end
