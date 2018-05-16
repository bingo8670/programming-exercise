# 简单爬虫
require 'mechanize'

DOMAIN = 'http://www.new1.uestc.edu.cn'
BASIC_NEWS_URI = 'http://www.new1.uestc.edu.cn/?n=UestcNews.Front.Category.Page&CatId='

def find_news(uri)
    links = Mechanize.new.get(uri).search("h3 a").to_a
    links.each do |link|
        print link.text, "(", DOMAIN + link.values[0], ")\n"
    end
end

def title(id)
    case id
    when 42 then "焦点新闻"
    when 68 then "公告新闻"
    when 67 then "文化新闻"
    end
end

print "开始爬虫时间：#{Time.new.strftime "%Y-%m-%d %H:%M:%S"}\n\n"
[42, 68, 67].each do |id|
    uri = BASIC_NEWS_URI + id.to_s
    print title(id), "：\n\n"
    find_news uri
    puts
end
