define ['require', 'zest', 'ace/ace'], (req, $z, ace) ->
  $z.create [$z.Component],
    construct: (el, o) ->
      console.log 'editor construct'
      @$container = el
      @editor = ace.edit el
      @session = @editor.getSession()
      
      if (o.theme)
        @editor.setTheme 'ace/theme/' + o.theme

      if (o.mode)
        req ['ace/mode/' + o.mode], (mode) =>
          @editor.getSession().setMode new mode.Mode

      @session.setTabSize o.editorOptions.tabSize
      if !o.editorOptions.showGutter
        @editor.renderer.setShowGutter false

    prototype:
      getValue: -> @editor.getValue()
      setValue: (v) -> @editor.setValue v
      resize: (w, h) ->
        @$container.style.width = w + 'px'
        @$container.style.height = h + 'px'
        @editor.resize()