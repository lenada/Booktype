python_pkgs = value_for_platform(
  ["debian","ubuntu"] => {
    "default" => ["python-pip","python-setuptools","redis-server"]
  },
  "default" => ["python-pip","python-setuptools"]
)

python_pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

