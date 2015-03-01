class Scraping
  def self.get_park
    links =[]
    agent = Mechanize.new
    page = agent.get('https://www.tokyo-park.or.jp/search/')
    elements = page.search('.tkp-link-list-A05 li a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end

    links.each do |link|
      begin
        page = agent.get('https://www.tokyo-park.or.jp' + link)
      rescue
        puts "  caught Net::HTTPNotFound !"
        next # ページが見付からないときは次へ
      end
      get_parks(page)
    end
end

  def self.get_parks(page)
    elements = page.search('.tkp-search-list-content-A01') if page.search('.tkp-search-list-content-A011')
    # image_url = page.search('.tkp-image-block-A01 img')[:src] if page.search
    elements.each do |element|
      park_name = element.at('a').inner_text
      image_url = element.at('img')[:src]
      park = Park.where(:park_name => park_name).first_or_initialize
      park.image_url = image_url
      park.save
    #   Park.where(:park_name => park_name).first_or_create
    end
  end

end