define ['zest'], ($z) ->
  type: 'Editor'

  options:
    content: ''
    theme: 'twilight'
    mode: 'javascript'
    width: 200
    height: 600
    editorOptions:
      tabSize: 2
      showGutter: false
  
  pipe: (o) ->
    theme: o.theme
    mode: o.mode
    editorOptions: o.editorOptions

  render: (o) -> """
    <div style="
      width: #{$z.esc o.width, 'cssAttr'}px;
      height: #{$z.esc o.height, 'cssAttr'}px;
      position: 'relative';
    " class="ace-editor">#{$z.esc o.content, 'html'}</div>
  """

  attach: 'cs!./ace-attach'