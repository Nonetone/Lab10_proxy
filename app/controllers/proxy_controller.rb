   require 'nokogiri'
   require 'open-uri'
    class ProxyController < ApplicationController
     before_action :parse_params, only: :output
        def output
            my_url = URL + "&number=#{@number}"
            api_response = open(my_url)
            if @side == 'server'
                @result = xslt_transform(api_response).to_html
            elsif
                @side == 'client-with-xslt'
                render xml: insert_browser_xslt(api_response).to_xml
            else
                render xml: api_response
            end
        end
        private
            URL = 'http://localhost:3000/?format=xml'.freeze
            SERVER_TRANS = "#{Rails.root}/public/server_transform.xslt".freeze
            BROWSER_TRANS = '/browser_transform.xslt'.freeze
        def parse_params
            @number = params[:number]
            @side = params[:side]
        end
        def xslt_transform(data, transform: SERVER_TRANS)
            doc = Nokogiri::XML(data)
            xslt = Nokogiri::XSLT(File.read(transform))
            xslt.transform(doc)
        end
        def insert_browser_xslt(data, transform: BROWSER_TRANS)
            doc = Nokogiri::XML(data)
            xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet', 'type="text/xsl"href="' + transform + '"')
            doc.root.add_previous_sibling(xslt)
            doc
        end
    end    
