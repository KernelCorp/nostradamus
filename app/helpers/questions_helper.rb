module QuestionsHelper
  def vk_button( title, description, image_url, html )
    args = [
      { 
        title: title, 
        description: description, 
        image: "#{request.protocol}#{request.host_with_port}#{image_url}"
      },
      { 
        type: 'custom', 
        text: html 
      }
    ]

    args.to_json
  end
end
