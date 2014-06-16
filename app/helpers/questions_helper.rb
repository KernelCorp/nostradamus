module QuestionsHelper
  def vk_button( title, description, html )
    args = [
      { title: title, description: description },
      { type: 'custom', text: html }
    ]

    args.to_json
  end
end
