
#Ransack search, how to search for each word by splitting input search parameter
#custom search 
#Ref: https://www.e-learn.cn/content/wangluowenzhang/1146575
Ransack.configure do |config|
  config.add_predicate 'has_any_term',
  arel_predicate: 'matches_any',
  formatter: proc { |v| v.scan(/\"(.*?)\"|(\w+)/).flatten.compact.map{|t| "%#{t}%"} },
  validator: proc { |v| v.present? },
  type: :string
end

Ransack.configure do |config|
  config.add_predicate 'has_every_term',
  arel_predicate: 'matches_all',
  formatter: proc { |v| v.scan(/\"(.*?)\"|(\w+)/).flatten.compact.map{|t| "%#{t}%"} },
  validator: proc { |v| v.present? },
  type: :string
end