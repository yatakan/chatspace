module MessageHelper
  def group_last_message(group)
    if group.messages.present?
      group.last_message_search
    else
      content_tag :p, "新しいチャットルームです"
    end
  end
end
