require 'rexml/document'

class ConvertToXamarinStudio
    def initialize(file)
        @xmldoc = REXML::Document.new(file)
        @xmlns = {};
    end

    def properties
        retval = []
        REXML::XPath.each(@xmldoc,"/UserSettings/Category/Category/FontsAndColors/Categories/Category/Items/Item", @xmlns) do |item|
            #<Item Name="Comment" Foreground="0x00808080" Background="0x02000000" BoldFont="No"/>
            retval.push({
                name: item.attributes['Name'],
                foreground: item.attributes['Foreground'],
                background: item.attributes['Background'],
                bold_font: item.attributes['BoldFont'],
                })
        end
        return retval
    end
    def property(name)
        properties.select do |property|
            property[:name]==name
        end
    end
end

require 'json'

class ReadMetaJson
    def initialize
        @meta = JSON.parse(File.read( File.join(File.dirname(__FILE__), "meta.json") ))
    end
    def colors
        @meta["colors"].map do |e| 
            l = {name: e["name"]}
        end
    end
    def text
        @meta["text"].map do |e|
            {name: e["name"]}
        end
    end
end
