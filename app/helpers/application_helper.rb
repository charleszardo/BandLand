module ApplicationHelper
  def auth_token_input
    "<input
        type=\"hidden\"
        name=\"authenticity_token\"
        value=\"#{ form_authenticity_token }\">".html_safe
  end
  
  def download_url_for(song_key)
      AWS::S3::S3Object.url_for(song_key, 'bandlandmusic', :authenticated => false)
  end
  
  def torrent_url_for(song_key)
      download_url_for(song_key) + "?torrent"
  end
end
