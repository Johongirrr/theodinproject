require_relative "caesar_cipher"
require "test/unit"
 
class TestCaesarCipher < Test::Unit::TestCase
 
  def test_case_with_5_steps
    assert_equal("Bmfy f xywnsl!", caesar_cipher("What a string!", 5) )
  end
  def test_case_with_7_steps
    assert_equal("Olssv doha @ pz *-/ rhrh THTH wkvm", caesar_cipher("Hello what @ is *-/ kaka MAMA pdof", 7) )
  end
  def test_case_with_13_steps
    assert_equal("Anffre Nonpuv", caesar_cipher("Nasser Abachi", 13))
  end
end