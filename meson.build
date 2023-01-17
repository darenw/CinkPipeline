project('CinkPipeline', 'vala', 'c')


sources = files(
  'src/main.vala',
  'src/test-simple.vala'
)


deps = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('gio-2.0'),
  dependency('gegl-0.4')
]

executable('cinkize', sources, dependencies:deps)
