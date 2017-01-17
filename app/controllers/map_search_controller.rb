class MapSearchController < WebsocketRails::BaseController
  def new_tester
    puts("hello world")
    puts(message)
    print("helo world 2")
    puts(message)
    Coin.within(0.185, :origin => [32.064510, 34.774286])
  end

end
