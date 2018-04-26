# -*- coding: utf-8 -*- #

describe Rouge::Lexers::Solidity do
  let(:subject) { Rouge::Lexers::Solidity.new }

  describe 'lexing' do
    include Support::Lexing

    it %(doesn't let a bad regex mess up the whole lex) do
      assert_has_token 'Error',          "var a = /foo;\n1"
      assert_has_token 'Literal.Number', "var a = /foo;\n1"
    end
  end

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.so'
      assert_guess Rouge::Lexers::JSON, :filename => 'foo.json'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/solidity'
      assert_guess Rouge::Lexers::JSON, :mimetype => 'application/json'
      assert_guess Rouge::Lexers::JSON, :mimetype => 'application/vnd.api+json'
      assert_guess Rouge::Lexers::JSON, :mimetype => 'application/hal+json'
    end

  end
end
