
@zines.each do |zine|
  id = zine[:id]
  title = zine[:title]
  z = Zine.where(title: title).take(1).first
  remote_cover_image_url = "http://assets.zinedistro.org/zines/covers/#{id}.png"
  remote_pdf_url = "http://assets.zinedistro.org/zines/pdfs/#{id}.pdf"
  z.update_attributes( remote_pdf_url: remote_pdf_url, remote_cover_image_url: remote_cover_image_url)
end