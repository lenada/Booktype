# Booktype with vagrant in a box out of the box

##"Mission objectives"
 - setup a Booktype Installation automatically in a contained environment
 - virtualized development
 - reproducible portable development environments
 - plattform independent (linux/*nix)

##Requirements

###VirtualBox
download and install VirtualBox
https://www.virtualbox.org/

###rvm
vagrant and chef are rubies. we could just use the ruby that is already installed on our host machine (if) for example on os x.
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

## getting ready to box
    $ git clone git@github.com:lenada/Booktype.git
-
    $ cd Booktype/var/vagrant
-
	$ 
