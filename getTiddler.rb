require 'rubygems'
require 'httparty'

class Tiddler
    include HTTParty
    base_uri 'YOUR_CCTIDDLY_URL'
    # This assumes you are using HTTP basic auth, and the credentials for that
    # are the same as for cctiddly itself.
    basic_auth 'USERNAME', 'PASSWORD'

    attr_accessor :session_cookie

    def login(username, password)
        session_token = self.class.get('/handle/loginFile.php',
                :query => {:cctuser => username, :cctpass => password})

        @session_cookie = "txtUserName=" + username + "; sessionToken=" +
                session_token + ";"
    end

    def getTiddler(title)
        options = {:query => {:title => title}, 
            :headers => {"Cookie" => @session_cookie}}
        self.class.get('/handle/getTiddler.php', options)
    end
end
        
