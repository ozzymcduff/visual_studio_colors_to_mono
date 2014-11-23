require "test/unit"
require_relative "../lib/visual_studio_colors_to_mono"

class RenderToJsonTests < Test::Unit::TestCase
    def setup
        content = File.read( File.join(File.dirname(__FILE__), "./wekeroad-ink.vssettings") )
        @c = ConvertToXamarinStudio.new(content)
    end
    def test_can_render
        expected = <<eos
{
    "name":"Visual Studio",
    "version":"1.0",
    "description":"Reminiscent of Microsoft Visual Studio's default colors.",
    "originator":"Someone",
    "colors":[
        {"name": "Quick Diff(Changed)", "color":"#008000" },
        {"name": "Brace Matching(Rectangle)", "color":"#DBE0CC", "secondcolor":"#00000000" },
        {"name": "Punctuation(Brackets)", "fore":"#000000", "back":"#FFFFFF" },
    ]
}
eos
        assert_equal(expected, @c.to_json)
    end
end