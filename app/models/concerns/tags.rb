module Tags
  extend ActiveSupport::Concern

  included do
    has_many  :taggings
    has_many   :tags,    -> { order(id: :asc) }, through: :taggings, dependent: :destroy
  end

  def tag!(tags_attr)
    self.tags = tags_attr.map(&:strip).reject(&:blank?).map do |tag|
      Tag.where(name: tag.titleize).first_or_create
    end
  end

  def tag_list
    self.tags.map { |tag| tag.name }.join(', ') if self.tags
  end

  def tag_list=(tags_attr)
    self.tag!(tags_attr.split(','))
  end

end