define [
], () ->

  StorageHelper = 

    get: (key) ->
      @getLocal key

    set: (key, value) ->
      @setLocal key, value

    remove: (key) ->
      @removeLocal key
    


    getSession: (key) ->
      if window.Modernizr? and window.Modernizr.sessionstorage
        return window.sessionStorage.getItem key
      else
        return @getCookie 'session.'+key

    setSession: (key, value) ->
      if window.Modernizr? and window.Modernizr.sessionstorage
        return window.sessionStorage.setItem key, value
      else
        return @setCookie 'session.'+key, value, (2/24)

    removeSession: (key) ->
      if window.Modernizr? and window.Modernizr.sessionstorage
        return window.sessionStorage.removeItem key
      else
        return @removeCookie 'session.'+key


    getLocal: (key) ->
      if window.Modernizr? and window.Modernizr.localstorage
        return window.localStorage.getItem key
      else
        return @getCookie 'local.'+key

    setLocal: (key, value) ->
      if window.Modernizr? and window.Modernizr.localstorage
        return window.localStorage.setItem key, value
      else
        return @setCookie 'local.'+key, value

    removeLocal: (key) ->
      if window.Modernizr? and window.Modernizr.localstorage
        return window.localStorage.removeItem key
      else
        return @removeCookie 'local.'+key



    # Cookie
    # ----------------------------------------------------
    getCookie: (name) ->
      nameEQ = name + '='
      ca = document.cookie.split(';')
      i = 0
      while i < ca.length
        c = ca[i]
        c = c.substring(1, c.length)  while c.charAt(0) is ' '
        return c.substring(nameEQ.length, c.length)  if c.indexOf(nameEQ) is 0
        i++
      null

    setCookie: (name, value, days, path='/', domain) ->
      cookie = name+'='+value

      if days
        date = new Date()
        date.setTime date.getTime()+(days * 24 * 60 * 60 * 1000)
        cookie += '; expires='+date.toGMTString()
      if path
        cookie += '; path='+path
      if domain
        cookie += '; domain='+domain

      document.cookie = cookie
      null

    removeCookie: (name) ->
      @setCookie name, '', -1