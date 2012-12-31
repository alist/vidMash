@title = 'feedback'
@stylesheets = ['/css/style','/css/bootstrap.min']
@localScripts = ['/js/jquery.min','/js/bootstrap']


coffeescript ->
  player1 = null
  player2 = null
  player3 = null
  $(document).ready =>
    $(".opinionText").addClass("hidden")
    $(".opinionHeader").click (event) ->
      clicked = $(event.target)
      opinionDisplay = clicked.next()
      classHidden = "hidden"
      opinionDisplay.toggleClass(classHidden)

# 3. This function creates an <iframe> (and YouTube player)
#    after the API code downloads.
  window.onYouTubeIframeAPIReady = ->
    player1 = new YT.Player("player1",
      height: "390"
      width: "640"
      videoId: "5qm8PH4xAss"
      events:
        onReady: onPlayerReady
        onStateChange: onPlayerStateChange
    )
    player2 = new YT.Player("player2",
      height: "390"
      width: "640"
      videoId: "cjIvu7e6Wq8"
      events:
        onReady: onPlayerReady
        onStateChange: onPlayerStateChange
    )
    player3 = new YT.Player("player3",
      height: "390"
      width: "640"
      videoId: "9bZkp7q19f0"
      events:
        onReady: onPlayerReady
        onStateChange: onPlayerStateChange
    )

# 4. The API will call this function when the video player is ready.
  window.onPlayerReady = (event) ->
    if event.target == player1
      player1.playVideo()
    if event.target == player2
      player2.playVideo()
    if event.target == player3
      player3.playVideo()


# 5. The API calls this function when the player's state changes.
#    The function indicates that when playing a video (state=1),
#    the player should play for six seconds and then stop.
  
  done = false
  window.onPlayerStateChange = (event) ->
    if event.data is YT.PlayerState.PLAYING
      if event.target.getCurrentTime() < 2
        if event.target == player1
          event.target.seekTo 58.5, true
          setTimeout((  ->
            player2.playVideo()
            player1.stopVideo()
            $('#player2').removeClass('hidden')
            $('#player1').addClass('hidden')
            ),
            6000)

        if event.target == player2
          event.target.seekTo 87, true
          event.target.pauseVideo()

        if event.target == player3
          event.target.seekTo 94, true
          event.target.pauseVideo()
      else
        if event.target == player2
           setTimeout((  ->
            player3.playVideo()
            player2.stopVideo()
            $('#player3').removeClass('hidden')
            $('#player2').addClass('hidden')
            ),
            7000)

 
div 'header navbar-static-top', ->
  div 'container-fluid', ->
    div 'header', ->
      h1 'homeHeader', ->
        a  {href: "http://alist.im"}, ->
          "vidmash"


text '<div class="content container-fluid">'

h1 "mash"

div id:'player1', ->
div class:'hidden', id:'player2', ->
div class:'hidden', id:'player3', ->

#text '<iframe width="420" height="315" src="http://www.youtube.com/embed/dN3GbF9Bx6E" frameborder="0" allowfullscreen></iframe>'
#http://www.youtube.com/watch?v=FuLgWbqZuPs

text '''
 <script>
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');
      tag.src = "//www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  </script>
'''

text '</ div>'
