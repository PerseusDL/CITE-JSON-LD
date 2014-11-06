require_relative 'generator'
class FakeUser
  @users = [
    'adamt',
    'mary',
    'bob',
    'lfdm',
    'rrp'
  ]
  def self.get
    @users[ Generator.rint(0,@users.length-1) ]
  end
end