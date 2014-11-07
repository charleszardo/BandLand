require 'faker'

holger = User.new
holger.username = "holger"
holger.password = "123456"
holger.email = "holger@czukay.de"
holger.location = "Tokyo, Japan"
holger.bio = "godfather of sampling"
holger.save

klaus = User.new
klaus.username = "klaus"
klaus.password = "123456"
holger.location = "Berlin, Germany"
klaus.email = "klaus@voorman.de"
klaus.bio = "the beatle"
klaus.save

dummy = User.new
dummy.username = "test"
dummy.location = "NY, NY"
dummy.password = "123456"
dummy.email = "dummy@dummy.com"
dummy.save



