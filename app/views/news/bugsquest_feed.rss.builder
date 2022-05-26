xml.instruct! :xml, :version => "1.0" 
xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title 'バグズクエスト'
    xml.description '「バグズクエスト」のお知らせです'
    xml.link @article_base_url
    xml.lastBuildDate @news[0].news_date.in_time_zone(Time.zone).to_s(:rfc822)
    xml.language 'ja'
    xml.copyright '© copyright 2022 Bugsquest All Rights Reserved.'
    @news.each do |new|
      xml.item do
        xml.title new.title
        xml.description new.article
        xml.pubDate new.news_date.in_time_zone(Time.zone).to_s(:rfc822)
        xml.guid @article_base_url + new.id.to_s
        xml.link @article_base_url + new.id.to_s
      end
    end
  end
end