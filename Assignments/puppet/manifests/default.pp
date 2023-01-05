# some of the code is adopted from https://github.com/patrickdlee/vagrant-examples

# create a new run stage to ensure certain modules are included first
stage { 'pre':
  before => Stage['main']
}

# add the baseconfig module to the new 'pre' run stage
class { 'baseconfig':
  stage => 'pre'
}


# all boxes get the base config
include baseconfig

node 'appserver' {
  include nodejs
}

node 'dbserver' {
  include mysql
}

node default {
  
}