require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutSymbols < EdgeCase::Koan
  def test_symbols_are_symbols
    symbol = :ruby
    assert_equal __, symbol.is_a?(Symbol)
  end

  def test_symbols_can_be_compared
    symbol1 = :a_symbol
    symbol2 = :a_symbol
    symbol3 = :something_else

    assert symbol1 == __
    assert symbol1 != __
  end

  def test_identical_symbols_are_a_single_internal_object
    symbol1 = :a_symbol
    symbol2 = :a_symbol

    assert symbol1.equal?(__)
    assert_equal __, symbol2.object_id
  end

  def test_method_names_become_symbols
    all_symbols = Symbol.all_symbols

    assert_equal __, all_symbols.include?(:test_method_names_are_symbols)
  end

  RubyConstant = "What is the sound of one hand clapping?"
  def test_constants_become_symbols
    all_symbols = Symbol.all_symbols

    assert_equal true, all_symbols.include?(__)
  end

  def test_symbols_can_be_made_from_strings
    string = "catsAndDogs"
    assert_equal __, string.to_sym
  end

  def test_symbols_with_spaces_can_be_built
    symbol = :"cats and dogs"

    assert_equal symbol, __.to_sym
  end

  def test_to_s_is_called_on_interpolated_symbols
    symbol = :cats
    string = "It is raining #{symbol} and dogs."

    assert_equal __, string
  end

  def test_symbols_are_not_strings
    symbol = :ruby
    assert_equal __, symbol.is_a?(String)
    assert_equal __, symbol.eql?("ruby")
  end

  def test_symbols_do_not_have_string_methods
    symbol = :not_a_string
    assert_equal __, symbol.respond_to?(:each_char)
    assert_equal __, symbol.respond_to?(:reverse)
  end
  # It's important to realize that symbols are not "immutable
  # strings", though they are immutable. None of the
  # interesting string operations are available on symbols.
  def test_symbols_cannot_be_concatenated
    # Exceptions will be pondered further father down the path
    assert_raise(__) do
      :cats + :dogs
    end
  end
end
