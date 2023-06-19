module ApplicationHelper
  def default_meta_tags
    {
      site: 'Eleanor Returnsworth',
      title: meta_title,
      description: meta_description,
      image: meta_image,
      og: {
        title: meta_title,
        description: meta_description,
        type: 'website',
        url: request.original_url,
        image: image_url(meta_image)
      }
    }
  end

  def meta_title
    "Eleanor Returnsworth - E-commerce Returns Coordination"
  end

  def meta_description
    "Eleanor Returnsworth helps coordinate e-commerce client service officers with warehouse operators to monitor product returns efficiently."
  end

  def meta_image
    "cover.png"
  end
end
