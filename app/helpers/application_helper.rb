module ApplicationHelper
  def page_title(page_title = '')
    base_title = t 'defaults.site_title'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def default_meta_tags
    {
      site: 'Viva Price',
      title: '節約応援サービス',
      reverse: true,
      charset: 'utf-8',
      description: 'Viva Priceを使えば、あなただけの価格表が作成できます。',
      keywords: '節約,買い物',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        images: [
          { url: image_url('ogp.png'), secure_url: image_url('ogp.png') }
        ],
        locals: {
          'ja-JP': {}
        }
      },
      twitter: {
        card: 'summary_large_image',
        image: {
          _: image_url('ogp.png'),
          width: 1200,
          height: 630
        }
      }
    }
  end  
end
