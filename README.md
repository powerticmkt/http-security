# HTTP Security

[![Code Climate](https://codeclimate.com/github/trailofbits/http-security.png)](https://codeclimate.com/github/trailofbits/http-security) [![Build Status](https://travis-ci.org/trailofbits/http-security.svg)](https://travis-ci.org/trailofbits/http-security) [![Test Coverage](https://codeclimate.com/github/trailofbits/http-security/badges/coverage.svg)](https://codeclimate.com/github/trailofbits/http-security)

Security Headers is a parser for security-relevant HTTP headers. Each header
value is parsed and validated according to the syntax specified in its relevant 
RFC.

Security Headers relies on [parslet] for constructing its parsing grammar.

Currently parsed security headers are:

* X-Frame-Options
* Strict-Transport-Security
* X-Content-Type-Options
* X-XSS-Protection
* Cache-Control
* Pragma
* Expires
* X-Permitted-Cross-Domain-Policies
* Content-Security-Policy
* Content-Security-Policy-Report-Only

## Example

    require 'net/https'
    response = Net::HTTP.get_response(URI('https://twitter.com/'))

    require 'http/security'
    headers = HTTP::Security::Response.parse(response)

    headers.cache_control
    # => 

    headers.content_security_policy
    # => 

    headers.expires
    # => #<Date: 1981-03-31 ((2444695j,0s,0n),+0s,2299161j)>

    headers.pragma
    # => {:no_cache=>true}

    headers.strict_transport_security
    # => 

    headers.x_content_type_options
    # => {:nosniff=>true}

    headers.x_frame_options
    # => {:sameorigin=>true}

    headers.x_permitted_cross_domain_policies
    # => 

    headers.x_xss_protection
    # => {:enabled=>true, :mode=>"block"@8}

Requirements
------------

* [parslet] ~> 1.5

Install
-------

    $ gem install http-security

Testing
-------

To run the RSpec tests:

    $ rake spec

To test the parser against the Alexa Top 100:

    $ rake spec:gauntlet

License
-------

See the {file:LICENSE.txt} file.

[parslet]: http://kschiess.github.io/parslet/
