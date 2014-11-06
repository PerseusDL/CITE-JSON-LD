require_relative 'generator'
class FakeFiletype
  @types = [
    'TIFF',
    'JPEG',
    'JPG',
    'PNG',
    'GIF'
  ]
  def self.get
    @types[ Generator.rint(0,@types.length-1) ]
  end
end