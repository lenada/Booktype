python_eggs = value_for_platform(
  ["debian","ubuntu"] => {
    "default" => ["django==1.3.1","simplejson","unidecode","lxml","pil","South","psycopg2"]
  },
  "default" => ["django==1.3.1","simplejson","unidecode","lxml","pil","South","psycopg2"]
)   

python_eggs.each do |egg|
  python_pip egg do
    action :install
  end
end

