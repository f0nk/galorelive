#encoding: utf-8
class WelcomeController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'csv'
  require 'json'

  def index
 
    #@tmp = Item.order("created_at DESC")
    #@tmp2 = Picture.all
    films = Film.all
    @images = Array.new
    
    films.each do |film|
      newsitems = film.newsitems
      newsitems.each do |item|
        @images += item.images 
      end
    end

  end

  def scrape
    @sites = ["http://feeds2.feedburner.com/slashfilm", "http://feeds.feedburner.com/totalfilm/news", "http://feeds.ign.com/ign/movies-all","http://moviesblog.mtv.com/feed", "http://www.mtv.com/rss/news/movies_full.jhtml", "http://www.iwatchstuff.com/index.xml", "http://feeds.movieweb.com/movieweb_movienews", "http://imgur.com/r/movies", "http://feeds.feedburner.com/Cinecast", "http://feeds.feedburner.com/thr/film", "http://rss.firstshowing.net/firstshowing"]

    @sites2 = ["http://feeds2.feedburner.com/slashfilm", "http://feeds.feedburner.com/totalfilm/news","http://moviesblog.mtv.com/feed", "http://www.mtv.com/rss/news/movies_full.jhtml", "http://www.iwatchstuff.com/index.xml", "http://feeds.movieweb.com/movieweb_movienews", "http://imgur.com/r/movies", "http://feeds.feedburner.com/thr/film", "http://rss.firstshowing.net/firstshowing"]

    @sites3 = ["http://feeds2.feedburner.com/slashfilm", "http://feeds.feedburner.com/totalfilm/news","http://moviesblog.mtv.com/feed", "http://www.mtv.com/rss/news/movies_full.jhtml", "http://www.iwatchstuff.com/index.xml", "http://feeds.movieweb.com/movieweb_movienews", "http://imgur.com/r/movies", "http://feeds.feedburner.com/thr/film", "http://rss.firstshowing.net/firstshowing", "http://www.guardian.co.uk/film/filmblog/rss", "http://www.guardian.co.uk/film/rss","http://www.telegraph.co.uk/culture/film/rss", "http://www.fandango.com/rss/moviefeed", "http://latino-review.com/feed/", "http://imgur.com/r/movies/rss","http://www.joblo.com/newsfeeds/rss.xml", "http://geektyrant.com/news/rss.xml", "http://blastr.com/atom.xml", "http://www.iamrogue.com/news?format=feed", "http://www.denofgeek.com/feeds/all", "http://www.cinemablend.com/rss-all.xml"]

   @site5 = ["http://feeds2.feedburner.com/slashfilm"]
    #"http://www.iamrogue.com/news?format=feed"
    #, "http://blastr.com/atom.xml"
    # "http://feeds.feedburner.com/totalfilm/news"
    #http://imgur.com/r/movies/rss

        #@categories = ["All, Geek, News, Buzz, Fun, Top Hits"]


    @newssites = ["http://feeds2.feedburner.com/slashfilm", "http://www.iwatchstuff.com/index.xml", "http://feeds.movieweb.com/movieweb_movienews?format=xml", "http://feeds.feedburner.com/thr/film", "http://rss.firstshowing.net/firstshowing", "http://www.guardian.co.uk/film/filmblog/rss", "http://www.guardian.co.uk/film/rss","http://www.telegraph.co.uk/culture/film/rss", "http://www.fandango.com/rss/moviefeed", "http://latino-review.com/feed/", "http://www.joblo.com/newsfeeds/rss.xml", "http://www.cinemablend.com/rss-all.xml", "http://feeds.feedburner.com/totalfilm/news","http://www.iamrogue.com/news?format=feed", "http://feeds.feedburner.com/FilmSchoolRejects?format=xml", "http://feeds.feedburner.com/Pajiba"]


    @geeksites =["http://www.denofgeek.com/feeds/all", "http://geektyrant.com/news/rss.xml"]

    @funsites = ["http://imgur.com/r/movies/rss"]

    @buzzsites = ["http://moviesblog.mtv.com/feed", "http://www.mtv.com/rss/news/movies_full.jhtml",]

    @random = ["http://feeds2.feedburner.com/slashfilm", "http://www.denofgeek.com/feeds/all", "http://latino-review.com/feed/", "http://www.joblo.com/newsfeeds/rss.xml"]

   #scraping(@newssites, "News")
   #scraping(@geeksites, "Geek")
   #scraping(@funsites, "Fun")
   #scraping(@buzzsites, "Buzz")
 
  #Newsitem.destroy_all
  #Film.destroy_all

  scraping(@random, "Random")

  end

def thenumbers
  @sitecollectionlarge = ["http://www.the-numbers.com/movies/letter/3", "http://www.the-numbers.com/movies/letter/(","http://www.the-numbers.com/movies/letter/1","http://www.the-numbers.com/movies/letter/2", "http://www.the-numbers.com/movies/letter/4", "http://www.the-numbers.com/movies/letter/5" , "http://www.the-numbers.com/movies/letter/6", "http://www.the-numbers.com/movies/letter/7", "http://www.the-numbers.com/movies/letter/8", "http://www.the-numbers.com/movies/letter/9", "http://www.the-numbers.com/movies/letter/A", "http://www.the-numbers.com/movies/letter/B", "http://www.the-numbers.com/movies/letter/C", "http://www.the-numbers.com/movies/letter/D", "http://www.the-numbers.com/movies/letter/E", "http://www.the-numbers.com/movies/letter/F", "http://www.the-numbers.com/movies/letter/G", "http://www.the-numbers.com/movies/letter/H", "http://www.the-numbers.com/movies/letter/I", "http://www.the-numbers.com/movies/letter/J", "http://www.the-numbers.com/movies/letter/L", "http://www.the-numbers.com/movies/letter/K", "http://www.the-numbers.com/movies/letter/M", "http://www.the-numbers.com/movies/letter/N", "http://www.the-numbers.com/movies/letter/O", "http://www.the-numbers.com/movies/letter/P", "http://www.the-numbers.com/movies/letter/Q", "http://www.the-numbers.com/movies/letter/R", "http://www.the-numbers.com/movies/letter/S", "http://www.the-numbers.com/movies/letter/T)","http://www.the-numbers.com/movies/letter/U", "http://www.the-numbers.com/movies/letter/V", "http://www.the-numbers.com/movies/letter/W", "http://www.the-numbers.com/movies/letter/X", "http://www.the-numbers.com/movies/letter/Y", "http://www.the-numbers.com/movies/letter/Z"]  
#, "http://www.the-numbers.com/movies/letter/K"
  @sitecollection = ["http://www.the-numbers.com/movies/letter/3"]

  @items = Array.new
  @var = Array.new
  @var2 = Array.new
  k = Array.new
  progressbar = ProgressBar.create

CSV.open("test.csv", "w") do |csv|
  @sitecollectionlarge.each do |site|

   # xml_doc  = Nokogiri::HTML(open("http://www.the-numbers.com/movies/letter/A"))
    xml_doc  = Nokogiri::HTML(open(site))

  #   @items = xml_doc.css('div#page_filling_chart table tr')[10].text

     @var = xml_doc.css('div#page_filling_chart tr')
      #@var2 =xml_doc.css('div#page_filling_chart tr')[10].css('td')[1].text

                
                    @var.each do |item|
                      t = item.css('td')

                      if t[0].blank? == true #year
                        k[0] = ""
                      else
                        k[0] = t[0].text
                      end                      
                      if t[1].blank? == true #title
                        k[1] = ""
                      else
                        k[1] = t[1].text
                      end                      
                      if t[2].blank? == true #genre
                        k[2] = ""
                      else
                        k[2] = t[2].text
                      end                      
                      if t[3].blank? == true #production budget
                        k[3] = ""
                      else
                        k[3] = t[3].text
                      end
                      if t[4].blank? == true #domestic box office
                        k[4] = ""
                      else
                        k[4] = t[4].text
                      end                   

                      @temp2 = "k = "+ k[2]
                      if t[1].blank? == false 
                      #csv << [k[0],k[1],k[2],k[3],k[4],omdbapi(t[1].text)]
                       # csv << [k[0],k[1],k[2],k[3],k[4],omdbapi]
                        f = Film.new
                       # f.production_year = k[0][-4,4]
                        f.imdb_id = omdbapi(t[1].text, "imdbID")
                        if f.imdb_id.blank? == false
                        break if Film.where(:imdb_id => f.imdb_id).exists? == true 

                          omdbapiReturn =  omdbapiIMDB(f.imdb_id)
                          f.genre = omdbapiReturn ["Genre"]
                          f.production_year = omdbapiReturn ["Year"]
                          f.rating = omdbapiReturn ["Rated"]
                          f.running_time = omdbapiReturn ["Runtime"]
                          f.plot = omdbapiReturn ["Plot"]
                          f.poster = omdbapiReturn ["Poster"]
                          f.imdb_score = omdbapiReturn ["imdbRating"]
                        end
                        f.film_title = k[1]
                        f.budget = k[3]
                        f.overall_BO = k[4]
                       
                        f.save

                       progressbar.increment
                      
                      end      
                    end           
                 end
   end
end 

def omdbapi(t, p)
  #url = String.new
  url = "http://www.omdbapi.com/?t="+CGI::escape(t)
  @var = JSON.parse(open(url).read)
  sleep (0.1)
  return p @var [p]

end

def omdbapiIMDB(i)
  #url = String.new
  url = "http://www.omdbapi.com/?i="+i
  parsed = JSON.parse(open(url).read)
  sleep (0.2)
  return p parsed

end

def scraping(sitecollection, categ)

    sitecollection.each do |site|
      xml_doc  = Nokogiri::XML(open(site))
    
      @items = xml_doc.xpath("//item")

      if xml_doc.xpath("//title").first == nil
        @source = site
      else
        @source = xml_doc.xpath("//title").first.inner_text.to_s
      end
    

      @items.each do |item|
       # img_link =  item.to_html.scan(/http[^"]*jpg/).reject{|s|s.match(/http:\/\/media.movieweb.com\/i\/img\/feed\/fb.jpg/)}.reject{|t|t.include?('-70x53')}.reject{|k|k.include?('-550x')}.reject{|s|s.include?('--003')}.reject{|j|j.include?('-005')}.reject{|j|j.include?('tops')}.reject{|j|j.include?('-003.')}.reject{|j|j.include?('b.jpg')}.reject{|j|j.include?('h.jpg')}.reject{|j|j.include?('-007.jpg')}.reject{|j|j.include?('470-75.jpg')}.uniq

        title = item.xpath("title").inner_text.to_s.strip
        img_link = item.to_html.scan(/http[^"]*jpg/)
        description = item.xpath("description").inner_text.to_s.strip
        
        break if Newsitem.where(:news_title => title).exists? == true || Image.where(:image_source => img_link).exists? == true


        f = Film.new
        
        var = film_identifier(title, @source)


       # if Film.where(:film_title => var).exists? == true 

        f.film_title = var
        #f.film_title = title.match(/‘(.*?)’/).to_s.strip
        f.freebase_id = 'freebase id goes here'
        f.imdb_id = 'imdb id goes here'
        f.imdb_link = 'imdb link goes here'

          ni = Newsitem.new
          ni.news_source = @source.strip
          ni.news_type = categ
          ni.url = item.xpath("link").inner_text.to_s.strip
          ni.description = ''
          ni.news_title = title
          ni.keywords = ''
          ni.type = ''

            img_link.each do |p|
              pic = Image.new
              pic.image_source = p
              ni.images << pic
            end

        f.newsitems << ni

        f.save

      end  
    end
end


def film_identifier(title_string, source)
 # if source == '/Film' 
    var = title_string.scan(/‘(.*?)’/).to_s.strip

    if var.empty? == false 
      var[0] = ''
      var.chop!
      return var
    
    else

      return title_string

  end  
   
end

  def scraping_ref(sitecollection, categ)

    sitecollection.each do |site|
      xml_doc  = Nokogiri::XML(open(site))
    
      @items = xml_doc.xpath("//item")

      if xml_doc.xpath("//title").first == nil
        @source = site
      else
        @source = xml_doc.xpath("//title").first.inner_text.to_s
      end

      @items.each do |item|

        img_link =  item.to_html.scan(/http[^"]*jpg/).reject{|s|s.match(/http:\/\/media.movieweb.com\/i\/img\/feed\/fb.jpg/)}.reject{|t|t.include?('-70x53')}.reject{|k|k.include?('-550x')}.reject{|s|s.include?('--003')}.reject{|j|j.include?('-005')}.reject{|j|j.include?('tops')}.reject{|j|j.include?('-003.')}.reject{|j|j.include?('b.jpg')}.reject{|j|j.include?('h.jpg')}.reject{|j|j.include?('-007.jpg')}.reject{|j|j.include?('470-75.jpg')}.uniq

        title = item.xpath("title").inner_text.to_s.strip

        break if Picture.where(:url => img_link).exists? == true || Item.where(:title => title).exists? == true

          i = Item.new
          i.title = title
          i.keywords = item.xpath("category").inner_text.to_s.gsub( / /, "," )
          i.article_url = item.xpath("link").inner_text.to_s.strip
          i.source_list = @source.strip
          i.category_list = categ + ", All"
          #i.tag_list = title.gsub(' ',', ').gsub('-',' ').gsub(/([\:\/()'?".!-])/, '') + ',' + item.xpath("category").inner_text.to_s.split(/(?=[A-Z])/).join(' ').gsub(' ',',').gsub(',,',',').gsub(/([\:\/()'?".!-])/, '')
          i.save

          img_link.each do |p|
            pic = Picture.new
            pic.url = p
            i.pictures << pic
          end      
        end
      end
  end

  def cleanup
    @tagscount = []
    @tagscount = ActiveRecord::Base.connection.execute("SELECT COUNT (*) FROM tags").to_s
    @count = @tagscount[@tagscount.length-3].to_i

    @tagscount2 = []
    @tagscount2 = ActiveRecord::Base.connection.execute("SELECT COUNT (*) FROM taggings").to_s
    @count2 = @tagscount2[@tagscount2.length-3].to_i

    @numberofrows = Item.count + Picture.count + (3*Item.count)
    @numberofrows.to_f
    @threshold = 9990.to_f

    if @numberofrows > @threshold
        @items = Item.order("created_at ASC").limit(100)
          @items.each do |i|
            i.pictures.destroy_all
         end
        @items.destroy_all
    end
    
  end
end
