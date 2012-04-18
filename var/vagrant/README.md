# Booktype [![BuildStatus](https://secure.travis-ci.org/lenada/Booktype.png)](http://travis-ci.org/lenada/Booktype) installation and development with Vagrant
##want?
 - setup a Booktype Installation automatically in a virtual environment
 - having the booktype source and app files in you native OS of choice
 - reproducible portable development environments
 - plattform independent (linux/*nix(Theoretically windows http://rubyinstaller.org/))
 - http://vagrantup.com/

##Requirements

###VirtualBox
download and install VirtualBox
https://www.virtualbox.org/
### Build essentials
make sure you have buildtools for your os installed
(install XCode and DevTools if your on os x)

###rvm
vagrant and chef are rubies. we could just use the ruby that is already installed on our host machine*.
But ideally we keep even ruby versions and its gems within the user folder.
or even in our project.

rvm will help to do so :)

see http://beginrescueend.com/ 

    $ curl -L get.rvm.io | bash -s stable
Reload your shell environment:
       
    $ source ~/.bash_profile
Find the requirements (follow the instructions):

    $ rvm requirements
Install ruby:

    
    $ rvm install 1.9.3


###vagrant
see http://vagrantup.com/

	$ which gem

output should be the gem we installed through rvm 
for example /Users/leander/.rvm/rubies/ruby-1.9.3-p0/bin/gem

not the ruby/gem that comes with your host os*

	$ gem install vagrant

download and add vanilla base box

    $ vagrant box add base http://files.vagrantup.com/lucid32.box
  
this will install a mostly vanilla flavoured ubuntu lts(lucid), with ruby preinstalled[…] ready to be provisioned by vagrant/Chef



## $ vagrant up or Booktype almost ready
    $ git clone git@github.com:lenada/Booktype.git
-
    $ cd Booktype/var/vagrant
-
    $ vagrant up

An ugly VirtualBox window should come up ;)

[..]still a little work to do
for now provisioning works until /createbooki --database […]
quite happy so far, as the python/django dependency installation is already working.

createbooki should have created a mybooktype folder within var/www

go to http://127.0.0.1:8000
and access your booktype

### Troubleshooting
if provisioning (vagrant up) stops with
       
    E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
    ---- End output of apt-get -q -y install postgresql-client=8.4.8-0ubuntu0.10.04 ----

    Chef never successfully completed! Any errors should be visible in the
    output above. Please fix your recipes so that they properly complete.

ssh into the booktype VM with

    $ vagrant ssh
and do an apt-get update manually

    $ sudo apt-get update

then exiting the vm shell to get back to your vagrant directory on the host os

    $ exit

run provisioning again

    $ vagrant provision

-

* using Os X 10.7.3 with Xcode 4.1