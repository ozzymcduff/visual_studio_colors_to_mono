require_relative "../lib/visual_studio_colors_to_mono"
require "test/unit"

class ReadPropertiesTests < Test::Unit::TestCase
    def setup
        content = File.read( File.join(File.dirname(__FILE__), "wekeroad-ink.vssettings") )
        @c = ConvertToXamarinStudio.new(content)
    end

    def test_should_be_able_to_read_property_from_file
        assert_equal([{
            name: "Comment",
            foreground: "0x00808080",
            background: "0x02000000",
            bold_font: "No"
            }], @c.property("Comment"))
    end
end
