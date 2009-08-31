require "helper"

module Nokogiri
  module XML
    class TestEntityDecl < Nokogiri::TestCase
      def setup
        super
        @xml = Nokogiri::XML(<<-eoxml)
<?xml version="1.0"?><?TEST-STYLE PIDATA?>
<!DOCTYPE staff SYSTEM "staff.dtd" [
   <!ENTITY ent1 "es">
]>
<root />
        eoxml

        @entities = @xml.internal_subset.children
        @entity_decl = @entities.first
      end

      def test_original_content
        assert_equal "es", @entity_decl.original_content
      end

      def test_content
        assert_equal "es", @entity_decl.content
      end

      def test_type
        assert_equal 17, @entities.first.type
      end

      def test_class
        assert_instance_of Nokogiri::XML::EntityDeclaration, @entities.first
      end

      def test_attributes
        assert_raise NoMethodError do
          @entity_decl.attributes
        end
      end

      def test_namespace
        assert_raise NoMethodError do
          @entity_decl.namespace
        end
      end

      def test_namespace_definitions
        assert_raise NoMethodError do
          @entity_decl.namespace_definitions
        end
      end

      def test_line
        assert_raise NoMethodError do
          @entity_decl.line
        end
      end

      def test_inspect
        assert_equal(
          "#<#{@entity_decl.class.name}:#{sprintf("0x%x", @entity_decl.object_id)} #{@entity_decl.to_s.inspect}>",
          @entity_decl.inspect
        )
      end
    end
  end
end